#include <Arduino.h>
#include <EEPROM.h>
#include <avr/power.h>
#include <avr/sleep.h>

#include <TM1637Display.h>
#include <Bounce2.h>

#include <Voltage.h>
#include <TP4056.h>

#include <Menu7Seg.h>

#define BUZZER_PIN 6
#define RT_SW 2
#define RT_CLK 3
#define RT_DT 7
#define DISPLAY_CLK A5
#define DISPLAY_DIO A4
#define ENABLE_LCD 5

#define TP4056_PIN_STDBY A3
#define TP4056_PIN_CHRG A2
//#define TP4056_PIN_USB_PWR A0


#define EEPROM_ADDRESS_ALARM_TIME 0

TM1637Display display(DISPLAY_CLK, DISPLAY_DIO);
Bounce debouncer = Bounce();
Voltage voltage;
Menu7Seg menu = Menu7Seg();
TP4056 tp4056 = TP4056();

const uint8_t LOW_BATT[] = {
  SEG_D | SEG_E | SEG_F,
  SEG_A | SEG_B | SEG_C | SEG_D | SEG_E | SEG_F,
  0x00,
  SEG_A | SEG_B | SEG_C | SEG_D | SEG_E | SEG_F | SEG_G
};

const uint8_t CHARGING_BATT[] = {
  SEG_A | SEG_F | SEG_E | SEG_D,
  SEG_F | SEG_G | SEG_E | SEG_B | SEG_C,
  0x00,
  SEG_C | SEG_D | SEG_E | SEG_F | SEG_G
};

const uint8_t FULL_BATT[] = {
  SEG_A | SEG_F | SEG_G | SEG_E,
  SEG_F | SEG_B | SEG_E | SEG_D | SEG_C,
  SEG_F | SEG_E | SEG_D,
  SEG_F | SEG_E | SEG_D,
};

#define TIMER_MODE_NOTHING 0
#define TIMER_MODE_TIMER_ACTIVE 1
#define TIMER_MODE_FULL_BATT 2
#define TIMER_MODE_MENU_ACTIVE 2

const double battery_low = 2.9;

unsigned long buttonPressTimeStamp;
volatile long wakeup_time = 0;
volatile uint8_t clk_current = 0;
volatile uint8_t clk_last = 0;

short timer_secs_last_start = 300;
volatile short timer_secs_last_pos = 99;
volatile short timer_secs = 300;
volatile short play_sound_status = 0;
volatile short display_enabled = 0;
volatile short timer_mode = TIMER_MODE_NOTHING;
volatile bool update_display = true;
volatile bool wakeup_via_tp4056 = false;

uint8_t setting_alarm_time_seconds = 20;
bool button_long_toggle = false;

int secondsToDisplay(int i) {
  int h = i / 60;

  return (h * 100) + (i - (h * 60));
}


void enable_display() {
  if (display_enabled != 1) {
    digitalWrite(ENABLE_LCD, HIGH);
    display.setBrightness(3);
  }
}

void disable_display() {
  if (display_enabled != 0) {
    digitalWrite(ENABLE_LCD, LOW);
  }
}

void setup_timer() {
  noInterrupts();
  GTCCR |= (1 << TSM) | (1 << PSRASY);
  ASSR |= (1 << AS2);
  TCCR2A = (1 << WGM21);
  TCCR2B |= (1 << CS22) | (1 << CS21);
  OCR2A = 128 - 1; // 1s
  TIMSK2 |= (1<<OCIE2A);
  GTCCR &= ~(1 << TSM);
  interrupts();
}

void goto_sleep() {
  display.clear();
  disable_display();

  set_sleep_mode(SLEEP_MODE_PWR_DOWN);
  sleep_enable();
  sleep_mode();
  sleep_disable();
}

void timer_up() {
  // if timer is running you can not change the value
  if (timer_mode == TIMER_MODE_TIMER_ACTIVE) {
    return;
  }
  if (menu.active()) {
    menu.up();
    return;
  }

  timer_secs_last_pos = timer_secs;
  update_display = true;
  timer_secs += 30;

  if (timer_secs > 5401) {
    timer_secs = 30;
  }
}

void timer_down() {
  // if timer is running you can not change the value
  if (timer_mode == TIMER_MODE_TIMER_ACTIVE) {
    return;
  }
  if (menu.active()) {
    menu.down();
    return;
  }

  timer_secs_last_pos = timer_secs;
  update_display = true;
  timer_secs -= 30;

  if (timer_secs == 0) {
    timer_secs = 5400;
  }
}

void rt_int_sw() {
  if (menu.active()) {
    // if menu is active, just do nothing
    return;
  }
  // just wake up
  enable_display();
  debouncer.update();
  wakeup_time = millis();
  // if alarm is current running, abort it
  if (play_sound_status == 1) {
    play_sound_status = 2;
  }
}

void rt_int_clk() {
  enable_display();
  wakeup_time = millis();
  clk_last = clk_current;
  clk_current = digitalRead(RT_CLK);

  if (clk_last == LOW && clk_current == HIGH) {
    if (digitalRead(RT_DT) == LOW) {
      timer_up();
    }
    else {
      timer_down();
    }
  }
}

ISR(PCINT1_vect) {
  enable_display();
  wakeup_via_tp4056 = true;
  wakeup_time = millis();

  if (tp4056.is_charging() == false && tp4056.is_charged() == false) {
    update_display = true;
  }
}

void disable_timer() {
  noInterrupts();
  GTCCR |= (1 << TSM) | (1 << PSRASY);
  TCCR2A = 0;
  TCCR2B = 0;
  interrupts();
}

ISR(TIMER2_COMPA_vect) {
  TCCR2B = TCCR2B;
  timer_secs_last_pos = timer_secs;
  update_display = true;
  timer_secs--;

  while(ASSR & ((1<<TCN2UB) | (1<<OCR2AUB) | (1<<OCR2BUB) | (1<<TCR2AUB) | (1<<TCR2BUB)));
}


void play(short pin, uint16_t frequency, uint16_t duration) {
  unsigned long start_time = millis();
  unsigned long halfPeriod = 1000000L / frequency / 2;
  pinMode(pin, OUTPUT);
  while (millis() - start_time < duration) {
    digitalWrite(pin, HIGH);
    delayMicroseconds(halfPeriod);

    digitalWrite(pin, LOW);
    delayMicroseconds(halfPeriod);

  }
  pinMode(pin,INPUT);
}


void play_sound() {
  play_sound_status = 1;
  short frequency = 3600;
  for (short i = 0; i < (setting_alarm_time_seconds * 2); i++) {
    play(BUZZER_PIN, frequency, 750);
    if (play_sound_status == 2) {
      // button pressed, abort sound
      break;
    }
    delay(500);
    if (play_sound_status == 2) {
      // button pressed, abort sound
      break;
    }

    if (frequency < 4500) {
      frequency += 200;
    }
  }
  play_sound_status = 0;
}

void setup() {
  // read settings from EEPROM
  EEPROM.get(EEPROM_ADDRESS_ALARM_TIME, setting_alarm_time_seconds);
  if (setting_alarm_time_seconds > 20 || setting_alarm_time_seconds == 0) {
    setting_alarm_time_seconds = 20;
  }
  voltage.init();
  power_usart0_disable();
  power_spi_disable();
  power_twi_disable();

  pinMode(RT_CLK, INPUT_PULLUP);
  pinMode(RT_DT, INPUT_PULLUP);
  pinMode(RT_SW, INPUT_PULLUP);
  pinMode(BUZZER_PIN, INPUT);

  pinMode(ENABLE_LCD, OUTPUT);
  enable_display();

  debouncer.attach(RT_SW);
  debouncer.interval(25);

  attachInterrupt(digitalPinToInterrupt(RT_CLK), rt_int_clk, CHANGE);
  attachInterrupt(digitalPinToInterrupt(RT_SW), rt_int_sw, FALLING);

  wakeup_time = millis();

  menu.init(&debouncer, &display, setting_alarm_time_seconds);

  tp4056.init(TP4056_PIN_CHRG, TP4056_PIN_STDBY);
  tp4056.set_pullup();
  tp4056.setup();

  // interrupts for TP4056
  noInterrupts();
  PCICR |= (1 << PCIE1);
  PCMSK1 |= (1<<PCINT10); // A2
  PCMSK1 |= (1<<PCINT11); // A3
  interrupts();
}
void loop() {
  debouncer.update();
  if (debouncer.fell()) {
    buttonPressTimeStamp = millis();
    button_long_toggle = true;
  }
  if (debouncer.read() == LOW && millis() - buttonPressTimeStamp >= 500 && button_long_toggle == true) {
    // if button is hold too long only do one action
    button_long_toggle = false;
    if (timer_mode == TIMER_MODE_TIMER_ACTIVE) {
      // if timer is active and button is pressed longer, reset timer
      disable_timer();
      timer_mode = TIMER_MODE_NOTHING;
      timer_secs = timer_secs_last_start;
      update_display = true;
    }
    else {
      if (menu.active() == false) {
        // if timer is not active and we have a long press goto menu
        menu.enable();
        timer_mode = TIMER_MODE_MENU_ACTIVE;
      }
      else {
        // if timer is not active and we have a long press and we are inside the menu goto normal mode
        menu.disable();
        timer_mode = TIMER_MODE_NOTHING;
        update_display = true;
        wakeup_time = millis();

        // save settings into eeprom
        setting_alarm_time_seconds = menu.get_alarm_timer_seconds();
        EEPROM.update(EEPROM_ADDRESS_ALARM_TIME, setting_alarm_time_seconds);
      }
    }
    return;
  }
  if (menu.active() == true) {
    menu.update();
    return;
  }
  if (debouncer.rose() && timer_mode == TIMER_MODE_NOTHING && debouncer.previousDuration() < 400) {
    // check battery level before going to timer
    if (battery_low > (double)voltage.read()) {
      display.setSegments(LOW_BATT);
      play(BUZZER_PIN, 2000, 50);
      delay(500);
      play(BUZZER_PIN, 2000, 50);
      delay(500);
    }
    // if button is pressed and timer is not active, start countdown
    play(BUZZER_PIN, 3000, 100);
    timer_secs_last_start = timer_secs;
    timer_mode = TIMER_MODE_TIMER_ACTIVE;
    setup_timer();
  }
  if (timer_mode == TIMER_MODE_TIMER_ACTIVE) {
    if (timer_secs == 0) {
      disable_timer();
      display.showNumberDecEx(0, 64, true);
      timer_mode = TIMER_MODE_NOTHING;
      timer_secs = timer_secs_last_start;
      play_sound();

      // timer is finished, we update display with the last timer pos
      // also set wakeup_via_tp4056 to update display if usb cable is connected
      wakeup_time = millis();
      update_display = true;
      wakeup_via_tp4056 = true;
    }
  }

  if (update_display == true) {
    update_display = false;
    display.showNumberDecEx(secondsToDisplay(timer_secs), 64, false);
  }

  // if usb cable is connected and timer is not running we display chg or full message
  if (wakeup_via_tp4056 == true) {
    wakeup_via_tp4056 = false;
    if (timer_mode == TIMER_MODE_NOTHING) {
      if (tp4056.is_charged() == true) {
        display.setSegments(FULL_BATT);
      }
      if (tp4056.is_charging() == true) {
        display.setSegments(CHARGING_BATT);
      }
    }
  }

  if (tp4056.is_charging() == false && tp4056.is_charged() == false && timer_mode == TIMER_MODE_NOTHING && millis() - wakeup_time >= (10 * 1000)) {
    // if timer is not active and no user action within 10s and not charging and not fully charged => goto sleep
    goto_sleep();
  }
  if (timer_mode == TIMER_MODE_NOTHING && millis() - wakeup_time >= (5 * 1000) && tp4056.is_charged() == true) {
    // if nothing is active and buttons / encoder is not used and battery is full, display message
    display.setSegments(FULL_BATT);
  }
  if (timer_mode == TIMER_MODE_NOTHING && millis() - wakeup_time >= (5 * 1000) && tp4056.is_charging() == true) {
    // if nothing is active and buttons / encoder is not used and battery is full, display message
    display.setSegments(CHARGING_BATT);
  }
}
