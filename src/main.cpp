#include <Arduino.h>
#include <avr/power.h>
#include <avr/sleep.h>

#include <TM1637Display.h>
#include <Bounce2.h>

#define BUZZER_PIN 6
#define RT_SW 2
#define RT_CLK 3
#define RT_DT 7
#define DISPLAY_CLK 8
#define DISPLAY_DIO 9
#define ENABLE_LCD A0

TM1637Display display(DISPLAY_CLK, DISPLAY_DIO);
Bounce debouncer = Bounce();
unsigned long buttonPressTimeStamp;
volatile long wakeup_time = 0;
volatile uint8_t clk_current = 0;
volatile uint8_t clk_last = 0;

short timer_secs_last_start = 300;
volatile short timer_secs_last_pos = 99;
volatile short timer_secs = 300;
volatile short timer_active = 0;
volatile short play_sound_status = 0;
volatile short display_enabled = 0;

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
  if (timer_active == 1) {
    return;
  }

  timer_secs_last_pos = timer_secs;
  timer_secs += 30;

  if (timer_secs > 5401) {
    timer_secs = 30;
  }
}

void timer_down() {
  // if timer is running you can not change the value
  if (timer_active == 1) {
    return;
  }

  timer_secs_last_pos = timer_secs;
  timer_secs -= 30;

  if (timer_secs == 0) {
    timer_secs = 5400;
  }
}

void rt_int_sw() {
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
  short frequency = 3100;
  for (short i = 0; i < 40; i++) {
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
  ADCSRA &=(~(1 << ADEN));
  power_adc_disable();
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
  debouncer.interval(5);

  attachInterrupt(digitalPinToInterrupt(RT_CLK), rt_int_clk, CHANGE);
  attachInterrupt(digitalPinToInterrupt(RT_SW), rt_int_sw, FALLING);

  wakeup_time = millis();
}

void loop() {
  debouncer.update();
  if (debouncer.fell()) {
    buttonPressTimeStamp = millis();
  }
  if (debouncer.read() == LOW && millis() - buttonPressTimeStamp >= 200) {
    if (timer_active == 1) {
      // if timer is active and button is pressed longer, reset timer
      disable_timer();
      timer_active = 0;
      timer_secs = timer_secs_last_start;
    }
  }
  if (debouncer.fell() && timer_active == 0) {
    // if button is pressed and timer is not active, start countdown
    timer_secs_last_start = timer_secs;
    timer_active = 1;
    setup_timer();
  }
  if (timer_active == 1) {
    if (timer_secs == 0) {
      disable_timer();
      display.showNumberDecEx(0, 64, true);
      timer_active = 0;
      timer_secs = timer_secs_last_start;
      play_sound();
      goto_sleep();
    }
  }
  if (timer_secs_last_pos != timer_secs) {
    display.showNumberDecEx(secondsToDisplay(timer_secs), 64, false);
  }
  if (timer_active == 0 && millis() - wakeup_time >= (10 * 1000)) {
    // if timer is not active and no user action within 10s, goto sleep
    goto_sleep();
  }
}
