#include <Arduino.h>
#include <avr/power.h>
#include <avr/sleep.h>

#include <TM1637Display.h>
#include <Bounce2.h>

#define BUZZER_PIN 10
#define RT_SW 2
#define RT_CLK 3
#define RT_DT 7
#define DISPLAY_CLK 8
#define DISPLAY_DIO 9

TM1637Display display(DISPLAY_CLK, DISPLAY_DIO);
Bounce debouncer = Bounce();
unsigned long buttonPressTimeStamp;
volatile long wakeup_time = 0;
volatile uint8_t clk_current = 0;
volatile uint8_t clk_last = 0;

volatile short timer_secs_last_pos = 99;
volatile short timer_secs = 300;
volatile short timer_active = 0;

int secondsToDisplay(int i) {
  int h = i / 60;

  return (h * 100) + (i - (h * 60));
}

void enable_display() {
  display.setBrightness(3);
}

void setup_timer() {
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  OCR1A = 15624;
  TCCR1B |= _BV(WGM12);
  TCCR1B |= _BV(CS10);
  TCCR1B |= _BV(CS11);
  TIMSK1 |= _BV(OCIE1A);
  interrupts();
}

void goto_sleep() {
  display.clear();

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

  if (timer_secs > 3601) {
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
    timer_secs = 3600;
  }
}

void rt_int_sw() {
  // just wake up
  debouncer.update();
  wakeup_time = millis();
}

void rt_int_clk() {
  wakeup_time = millis();
  clk_last = clk_current;
  clk_current = digitalRead(RT_CLK);

  if(clk_last != clk_current) {
    if(digitalRead(RT_DT) != clk_current) {
      timer_up();
    }
    else {
      timer_down();
    }
  }
}

void disable_timer() {
  noInterrupts();
  TCCR1B = 0;
  TIMSK1 = 0;
  interrupts();
}

ISR(TIMER1_COMPA_vect) {
  timer_secs_last_pos = timer_secs;
  timer_secs--;
}

void play_sound() {
  tone(BUZZER_PIN, 100);
  delay(10);
  noTone(BUZZER_PIN);
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
  pinMode(BUZZER_PIN, OUTPUT);

  debouncer.attach(RT_SW);
  debouncer.interval(5);

  attachInterrupt(digitalPinToInterrupt(RT_CLK), rt_int_clk, CHANGE);
  attachInterrupt(digitalPinToInterrupt(RT_SW), rt_int_sw, FALLING);

  enable_display();
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
      timer_secs = 300;
    }
  }
  if (debouncer.fell() && timer_active == 0) {
    // if button is pressed and timer is not active, start countdown
    timer_active = 1;
    setup_timer();
  }
  if (timer_active == 1) {
    if (timer_secs == 0) {
      disable_timer();
      timer_secs = 300;
      play_sound();
      goto_sleep();
      timer_active = 0;
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
