#include <math.h>
// All temperatures are in Celsius
#define THERMISTOR P1_4
#define HEATER P1_6
#define READINGS_FOR_AVERAGE 30
#define MILLIS_DELAY 1000
#define HEATER_ANALOGWRITE_STRENGTH 160
#define UNCERTAINTY 0.3


float targetTemp = 30.0;
unsigned long lastMillis = 0;

float getCurrentTemp() {
  int reading;
  for(int i=1;i<=READINGS_FOR_AVERAGE;i++) {
    reading = (reading*(i-1)+analogRead(THERMISTOR))/i;
  }
  reading = analogRead(THERMISTOR);
//  Serial.print("AnalogRead: ");
  Serial.println(reading);
  float temperature = (805.51-reading)/11.4;
  return temperature;
}

void setup()
{
  Serial.begin(9600);
  pinMode(THERMISTOR, INPUT);
  pinMode(HEATER, OUTPUT);
}

void loop()
{
  unsigned long currentMillis = millis();
  
  if(Serial.available()>0) {
    targetTemp = constrain(Serial.parseFloat(), 0, 100);
    Serial.flush();
  }
  
  if(currentMillis - lastMillis >= MILLIS_DELAY) {
    float currentTemp = getCurrentTemp();
  
    if(currentTemp - UNCERTAINTY > targetTemp) {
      Serial.println("// Heater off");
      analogWrite(HEATER, 0);
    } else if(currentTemp + UNCERTAINTY < targetTemp) {
      Serial.println("// Heater on");
      analogWrite(HEATER, HEATER_ANALOGWRITE_STRENGTH);
    }    
    Serial.println(currentTemp);
    lastMillis = currentMillis;
  }
}

