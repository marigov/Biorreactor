#define PHOTOINTERR P1_4
#define MOTOR P1_6

volatile int numtrig = 0;
int timeOfCycle = 1000;
unsigned long int timeOfLastLoop = 0;
int rpm;
int targetVal = 1000;
int analogVal = 150;

void trig() {
  numtrig++;
}

void setup()
{
  pinMode(PHOTOINTERR, INPUT);
  pinMode(MOTOR, OUTPUT);
  
  Serial.begin(9600);
  
  analogWrite(MOTOR, analogVal);

  attachInterrupt(PHOTOINTERR, trig, FALLING);
}

void speedUp(int increment)
{
  if (analogVal < 255) {
    analogVal += increment;
  }
}

void speedDown(int decrement)
{
  if (analogVal > 0) {
    analogVal -= decrement;    
  } 
}

void loop()
{ 
  unsigned long mil = millis();
 
  if (Serial.available() > 0) {
    targetVal = Serial.parseInt();
    Serial.flush(); 
  }
  
  if (mil - timeOfLastLoop >= timeOfCycle) {
    rpm = numtrig * (30000/timeOfCycle);
    numtrig = 0;
    Serial.println(rpm);
    
    if (rpm < targetVal - 10) {
      if(targetVal - rpm > 500){
      speedUp(10);
      }else if(targetVal - rpm > 100){
      speedUp(5);
      }else{
      speedUp(1);
      }
    } else if (rpm > targetVal + 10) {
      if(rpm - targetVal > 500){
      speedDown(10);
      }else if(rpm - targetVal > 100){
      speedDown(5);
      }else{
      speedDown(1);
      }
    }
    analogWrite(MOTOR, analogVal);
    timeOfLastLoop = mil;  
  }
}
