#include <Arduino.h>

#include <TM1637Display.h>
#include <Bounce2.h>

class Menu7Seg {
  public:
    void init(Bounce *button, TM1637Display *display, uint8_t alarm_timer_seconds);
    void update(void);
    void enable(void);
    void disable(void);
    bool active(void);
    void up(void);
    void down(void);
    uint8_t get_alarm_timer_seconds(void);
  private:
    Bounce *button;
    TM1637Display *led;
    bool _active = false;
    short current_menu = 1;
    uint8_t alarm_timer_seconds;
};
