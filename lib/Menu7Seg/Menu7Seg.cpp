#include <Menu7Seg.h>

void Menu7Seg::init(Bounce *button, TM1637Display *led, uint8_t alarm_timer_seconds) {
  this->button = button;
  this->led = led;
  this->alarm_timer_seconds = alarm_timer_seconds;
}

void Menu7Seg::update(void) {
  // time how long alarm in seconds
  if (this->current_menu == 1) {
    uint8_t data[] = { 0x00, 0x00, 0x00, 0x00 };
    data[0] = this->led->encodeDigit(10);
    if (this->alarm_timer_seconds > 9) {
      data[2] = this->led->encodeDigit(((this->alarm_timer_seconds / 10 ) % 10));
      data[3] = this->led->encodeDigit((this->alarm_timer_seconds % 10 ));
    }
    else {
      data[3] = this->led->encodeDigit(this->alarm_timer_seconds);
    }
    this->led->setSegments(data);
  }
}

void Menu7Seg::enable(void) {
  this->_active = true;
}

void Menu7Seg::disable(void) {
  this->_active = false;
}

bool Menu7Seg::active(void) {
  return this->_active;
}

void Menu7Seg::up(void) {
  if (this->current_menu == 1) {
    this->alarm_timer_seconds++;
    if (this->alarm_timer_seconds > 20) {
      this->alarm_timer_seconds = 1;
    }
  }
}

void Menu7Seg::down(void) {
  if (this->current_menu == 1) {
    this->alarm_timer_seconds--;
    if (this->alarm_timer_seconds == 0) {
      this->alarm_timer_seconds = 20;
    }
  }
}
uint8_t Menu7Seg::get_alarm_timer_seconds(void) {
  return this->alarm_timer_seconds;
}
