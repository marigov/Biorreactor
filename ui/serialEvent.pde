int currentRPM;
float currentTEMP;
int currentPH;

boolean newData = false;

void serialEvent(Serial myPort) {
  
  if (myPort == myPortRPM)
  {
    while (myPortRPM.available() > 0)
    {
          String rpmString = myPortRPM.readStringUntil('\n');
  
          if (rpmString != null) 
          {
              rpmString = trim(rpmString);
              println(rpmString);
  
              currentRPM = Integer.parseInt(rpmString);
              if (currentRPM < 500)
              {
                currentRPM = 400;
              }
              
              else if (currentRPM > 2000)
              {
                currentTEMP = 2000;
              }
              currentTEMP = 20;//Float.parseFloat(splitString[1]);
              currentPH = 5; //Integer.parseInt(splitString[2]);
  
              newData = true;
  
          }
          
       
      }
    }
  
else if (myPort == myPortTEMP)
  {
    while (myPortTEMP.available() > 0)
    {
          String tempString = myPortTEMP.readStringUntil('\n');
  
          if (tempString != null) 
          {
              tempString = trim(tempString);
              println(tempString);
              
              if (currentTEMP < 10)
              {
                currentRPM = 10;
              }
              else if (currentTEMP > 44)
              {
                currentTEMP = 44;
              }
              currentRPM = 1000;
              currentTEMP = Float.parseFloat(tempString);
              currentPH = 5; //Integer.parseInt(splitString[2]);
  
              newData = true;
  
          }
          
       
      }
    }
    
else if (myPort == myPortPH)
  {
    while (myPortPH.available() > 0)
    {
          String phString = myPortPH.readStringUntil('\n');
  
          if (phString != null) 
          {
              phString = trim(phString);
              println(phString);
             
              currentRPM = 1000;
              currentTEMP = 20;
              currentPH = Integer.parseInt(phString);
              
               if (currentPH > 10)
              {
                currentPH = 10;
              }
              
               else if (currentPH < 0)
              {
                currentPH = 0;
              }
  
              newData = true;
  
          }
          
       
      }
    } 
    
}