import controlP5.*;
import processing.serial.*;

ControlP5 cp5;
Serial myPortRPM;
Serial myPortTEMP;
Serial myPortPH;


int targetRPM = 1000;
float targetTEMP = 20;
int targetPH = 5;


void setup() {

    size(800, 600);
    printArray(Serial.list()); // list all the available serial ports:
    
   // myPortRPM = new Serial(this, Serial.list()[3], 9600);
   // myPortRPM.bufferUntil('\n');
    
   // myPortTEMP = new Serial(this, Serial.list()[3], 9600);
  //  myPortTEMP.bufferUntil('\n');
    
    myPortPH = new Serial(this, Serial.list()[3], 9600);
    myPortPH.bufferUntil('\n');
    
    
    background(32,43,51);

    noStroke();
   loadSliders();
    loadButtons();
    fileLoad();
}

void draw() {
    loadGraph();
}