#include <Arduino.h>

#define led_pin LED_BUILTIN

void setup() {
  Serial.begin(115200);
  pinMode(led_pin, OUTPUT);
}

void loop() {
  if (Serial.available() > 0) {
    char inByte = Serial.read();
    if (inByte > 0) {
      if (inByte == 'H') {
        digitalWrite(led_pin, HIGH);
      } else if (inByte == 'L') {
        digitalWrite(led_pin, LOW);
      }
    }
  }
}
