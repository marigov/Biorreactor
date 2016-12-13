int xPos = 0;
int lastX = 400; // graph width 400px, then, we start with xPos = 0
int lastRPMy;
int lastTEMPy;
int lastPHy;

float inByteRPM = 0;
float inByteTEMP = 0;
float inBytePH = 0;

void loadGraph() {

    if (newData) {

        // re-mapping of current values to plot them

        inByteRPM = currentRPM;
        inByteRPM = map(inByteRPM, 400, 2000, 0, 295);

        inByteTEMP = currentTEMP;
        inByteTEMP = map(inByteTEMP, 10, 44, 0, 295);

        inBytePH = currentPH;
        inBytePH = map(inBytePH, 0, 9, 0, 295);
        // draw dots              

        stroke(222, 40,  103); // pink
        stroke(253, 165,  70); // yellow
        stroke(69,  205,  104); // green


        strokeWeight(1.0);
        
        stroke(222, 40,  103); // pink
        ellipse(xPos, 295 - inByteRPM, 2, 2);
        
        stroke(253, 165,  70); // yellow
        ellipse(xPos + 400, 295 - inByteTEMP, 2, 2);
        
        stroke(69,  205,  104  ); // green
        ellipse(xPos, height - 5 - inBytePH, 2, 2);

        // draw lines to connect dots 

        if (lastX != 390 && lastX != 0) {
            
            stroke(222, 40,  103); // pink
            line(lastX, lastRPMy, xPos, 295 - inByteRPM);
            
            stroke(253, 165,  70); // yellow
            line(lastX + 400, lastTEMPy, xPos + 400, 295 - inByteTEMP);
            
            stroke(69,  205,  104  ); // green
            line(lastX, lastPHy, xPos, height - 5 - inBytePH);
        }

        // upadte variables for new lines to be connected

        lastX = xPos;
        lastRPMy = int(295 - inByteRPM);
        lastTEMPy = int(295 - inByteTEMP);
        lastPHy = int(height - 5 - inBytePH);
        
        rpmDisplay();
        tempDisplay();
        phDisplay();


        // inital screen set-up

        if (xPos == 0) {
            background(32,43,51);
            stroke(30,  38,  44  );
            strokeWeight(1);

            line(0, 300, 800, 300); // x-axis line
            line(400, 0, 400, 600); //y-axis line

            // Titles and axis numbers

            textSize(14);
            fill(250, 250, 250);
            text("RPM", 180, 20);

            textSize(10);
            fill(250, 250, 250);
            text("1900", 20, 20);
            text("500", 20, 280);

            textSize(14);
            fill(250, 250, 250);
            text("Temperature", 570, 20);

            textSize(10);
            fill(250, 250, 250);
            text("42 ºC", 420, 20);
            text("12 ºC", 420, 280);

            textSize(18);
            fill(250, 250, 250);

            textSize(14);
            fill(250, 250, 250);
            text("pH", 185, 325);

            textSize(10);
            fill(250, 250, 250);
            text("8", 20, 340);
            text("1", 20, 570);
            
            textSize(14);
            fill(250, 250, 250);
            text("Control Center", 550, 325);

        rpmDisplay();
        tempDisplay();
        phDisplay();



        }

        // at the edge of the screen, go back to the beginning:

        if (xPos >= 390) {
            xPos = 0;
        } else {
            xPos += 10; // increment the horizontal position:
        }
        
        fileUpdate();
    }

    newData = false;

}

void resetText(int x, int y, int width, int height)
{
        noStroke();
        fill(149, 165, 166);
        rect(x, y, width, height);
}

void rpmDisplay()
{
  
                resetText(420, 340, 300, 40);                     
                textSize(14);
                fill(250, 250, 250);
                text("Current RPM: " + currentRPM, 425, 365);
                text("Target RPM: " + targetRPM, 580, 365);

      
}

void tempDisplay()
{
  
                resetText(420, 420, 300, 40);                     
                textSize(14);
                fill(250, 250, 250);
                text("Current Temp.: " + currentTEMP, 425, 445);
                text("Target Temp.: " + nf(targetTEMP, 2, 1), 580, 445);
   
}

void phDisplay()
{
  
                resetText(420, 500, 300, 40);                     
                textSize(14);
                fill(250, 250, 250);
                text("Current PH.: " + currentPH, 425, 525);
                text("Target PH.: " + targetPH, 580, 525);
   
}