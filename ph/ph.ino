#define ACIDPUMP P1_4
#define BASEPUMP P1_5
#define PHPROBE P1_3

float target_PH = 4.0;
float pHUncertainty = 0.5;

unsigned long int currentMillis = millis();
unsigned long int timeOfLastPHAdjustment = 0;
unsigned long int delayBetweenPHAdjustments = 500;
unsigned long int delayForPrint = 0;



void setup()
{
  
    Serial.begin(9600);
    pinMode(PHPROBE, INPUT);
    
    pinMode(ACIDPUMP, OUTPUT);
    pinMode(BASEPUMP, OUTPUT);
  
}


void addAcid() 
{
    timeOfLastPHAdjustment = millis();
    digitalWrite(ACIDPUMP, HIGH);
}


void addBase() 
{
    timeOfLastPHAdjustment = millis();
    digitalWrite(BASEPUMP, HIGH);
}

float getpHSensorValue() 
{
    unsigned long int avgValue;  //Store the average value of the sensor feedback
    float b;
    int buf[100],temp; 
  
    for(int i=0;i<100;i++)       //Get 10 sample value from the sensor for smooth the value
    { 
      buf[i]=analogRead(PHPROBE);      
    }
    
    for(int i=0;i<99;i++)        //sort the analog from small to large
    {
      for(int j=i+1;j<100;j++)
      {
        if(buf[i]>buf[j])
        {
          temp=buf[i];
          buf[i]=buf[j];
          buf[j]=temp;
        }
      }
  }
 
    avgValue=0;
    
    for(int i=0;i<99;i++)                      //take the average value of 6 center sample
      avgValue+=buf[i];
    
    float phValue=(float)(avgValue/100); 
    phValue = (phValue - 1031.2)/(-16.641);  
    
    return phValue;
}

boolean shouldAdjustPH (float currentPH) 

{
  if ((target_PH - pHUncertainty) <= currentPH && currentPH >= (target_PH + pHUncertainty))
  {
   return false;
  }
  
  else 
  {
    return true;
  }
}

void loop()
{
  if (Serial.available() > 0) {
    target_PH = Serial.parseInt();
    Serial.flush(); 
  }  
  
  float currentPH = getpHSensorValue();
  
    currentMillis = millis();  
    
    if (millis() - timeOfLastPHAdjustment >= 100) 
    { 
      digitalWrite(ACIDPUMP, LOW);
      digitalWrite(BASEPUMP, LOW);
    }
  
    if ((currentMillis - timeOfLastPHAdjustment) >= delayBetweenPHAdjustments && shouldAdjustPH(currentPH)) 
    {
      if(currentPH > target_PH)
      {
        addAcid();
      }
      else if (currentPH < target_PH) 
      {
       addBase(); 

      }  
    }
    
    if ((millis() - delayForPrint) > 1000)
   { 
      Serial.print(int(currentPH));
      Serial.print("\n");
      Serial.flush();
      delayForPrint = millis();  
      
   }

    
}
