void loadButtons()
{
  cp5.addButton("increase_RPM")
     .setValue(128)
     .setPosition(625, 380)
     .setSize(20,20)
     .setCaptionLabel("+")
     .setColorBackground(color(222, 40,  103))
     .setColorForeground(color(227, 109,  150));
     ;
     
     
    cp5.addButton("decrease_RPM")
     .setValue(128)
     .setPosition(647, 380)
     .setSize(20,20)
     .setCaptionLabel("-")
     .setColorBackground(color(222, 40,  103))
     .setColorForeground(color(227, 109,  150));
     ;
     
     
     cp5.addButton("increase_TEMP")
     .setValue(128)
     .setPosition(625, 460)
     .setSize(20,20)
     .setCaptionLabel("+")
     .setColorBackground(color(253, 165,  70))
     .setColorForeground(color(253, 202,  146));

     ;
     
    cp5.addButton("decrease_TEMP")
     .setValue(128)
     .setPosition(647, 460)
     .setSize(20,20)
     .setCaptionLabel("-")
     .setColorBackground(color(253, 165,  70))
     .setColorForeground(color(253, 202,  146));
     ;
     
     cp5.addButton("increase_PH")
     .setValue(128)
     .setPosition(625, 540)
     .setSize(20,20)
     .setCaptionLabel("+")
      .setColorBackground(color(69,  205,  104))
     .setColorForeground(color(136, 213,  156));
     ;
     
    cp5.addButton("decrease_PH")
     .setValue(128)
     .setPosition(647, 540)
     .setSize(20,20)
     .setCaptionLabel("-")
     .setColorBackground(color(69,  205,  104))
     .setColorForeground(color(136, 213,  156));
     ;
     
     cp5.addButton("set_RPM")
     .setValue(128)
     .setPosition(670, 380)
     .setSize(50,20)
     .setCaptionLabel("SET")
     .setColorBackground(color(222, 40,  103))
     .setColorForeground(color(227, 109,  150));

     ;
     
     cp5.addButton("set_TEMP")
     .setValue(128)
     .setPosition(670, 460)
     .setSize(50,20)
     .setCaptionLabel("SET")
     .setColorBackground(color(253, 165,  70))
     .setColorForeground(color(253, 202,  146));

     ;
     
     cp5.addButton("set_PH")
     .setValue(128)
     .setPosition(670, 540)
     .setSize(50,20)
     .setCaptionLabel("SET")
     .setColorBackground(color(69,  205,  104))
     .setColorForeground(color(136, 213,  156));

     ;
}

void set_RPM ()
{
   cp5.getController("set_RPM").setColorBackground(color(222, 40,  103));
   cp5.getController("set_RPM").setCaptionLabel("SET");
  
   myPortRPM.write(str(targetRPM));
   myPortRPM.clear();
   println("RPM set"); 

}

void set_TEMP ()
{
   cp5.getController("set_TEMP").setColorBackground(color(253, 165,  70));
   cp5.getController("set_TEMP").setCaptionLabel("SET");
  // myPortTEMP.write(str(targetTEMP));
  // myPortTEMP.clear();
   println("TEMP set"); 
   

}

void set_PH ()
{
   cp5.getController("set_PH").setColorBackground(color(69,  205,  104));
   cp5.getController("set_PH").setCaptionLabel("SET");
   //myPortPH.write(str(targetPH));
  // myPortPH.clear();
   println("PH set"); 

}


void increase_RPM() {
    
    targetRPM += 5;
    cp5.getController("slider_RPM").setValue(targetRPM);
    cp5.getController("set_RPM").setColorBackground(color(245, 34, 74));
    cp5.getController("set_RPM").setCaptionLabel("SEND");
}


void decrease_RPM() {
    
    targetRPM -= 5;
    cp5.getController("slider_RPM").setValue(targetRPM);
    cp5.getController("set_RPM").setColorBackground(color(245, 34, 74));
    cp5.getController("set_RPM").setCaptionLabel("SEND");
}

void increase_TEMP() {
    
    targetTEMP += 0.1;
    cp5.getController("slider_TEMP").setValue(targetTEMP);
    cp5.getController("set_TEMP").setColorBackground(color(245, 34, 74));
    cp5.getController("set_TEMP").setCaptionLabel("SEND");

}

void decrease_TEMP() {
    
    targetTEMP -= 0.1;
    cp5.getController("slider_TEMP").setValue(targetTEMP);
    cp5.getController("set_TEMP").setColorBackground(color(245, 34, 74));
    cp5.getController("set_TEMP").setCaptionLabel("SEND");

}

void increase_PH() {
    
    targetPH += 1;
    cp5.getController("slider_PH").setValue(targetPH);
    cp5.getController("set_PH").setColorBackground(color(245, 34, 74));
    cp5.getController("set_PH").setCaptionLabel("SEND");

}

void decrease_PH() {
    
    targetPH -= 1;
    cp5.getController("slider_PH").setValue(targetPH);
        cp5.getController("set_PH").setColorBackground(color(245, 34, 74));
    cp5.getController("set_PH").setCaptionLabel("SEND");

}