/*
 * ----------------------------------
 *   Slider Serial - Arduino
 * ----------------------------------
 *
 * Uses the Arduino serial library and a PC
 * running Processing to control the brightness
 * of an LED with PWM (pulse-width modulation).
 *
 * DEPENDENCIES:
 *   A connected PC running "Slider Serial - Processing"
 *     http://principialabs.com/arduino-processing-serial-communication
 *
 * Created:  6 April 2011
 * Author:   Brian D. Wendt
 *   (http://principialabs.com/)
 * Version:  1.0
 * License:  GPLv3
 *   (http://www.fsf.org/licensing/)
 *
 */

int LED = 9;  // any PWM pin (9 – 11)
int pulsewidth = 255;  // define pulsewidth (0-255)
int rawSerial;

void setup() {
   // Open serial connection, 9600 baud
   Serial.begin(9600);
}

void loop() {
   // Get serial input from Processing
   if (Serial.available()) {
     rawSerial = Serial.read();
     // uncomment these two lines to debug
     Serial.print(rawSerial, DEC);
     Serial.println();
    }
  // Map rawSerial percentage (0-100) to LED pulsewidth (0-255)
  pulsewidth = map(rawSerial, 0,100, 0,255);
  // Set LED brightness
  analogWrite(LED, pulsewidth);
}

