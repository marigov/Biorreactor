void loadSliders() {

    cp5 = new ControlP5(this);


    // RPM slider

    cp5.addSlider("slider_RPM")
        .setPosition(420, 380)
        .setSize(200, 20)
        .setRange(500, 1500)
        .setValue(1000)
        .setColorBackground(color(94,  17,  44))
        .setColorForeground(color(222, 40,  103))
        .setColorActive(color(227, 109,  150));
;

    cp5.getController("slider_RPM").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);


    //TEMP slider

    cp5.addSlider("slider_TEMP")
        .setPosition(420, 460)
        .setSize(200, 20)
        .setRange(15, 35)
        .setValue(20)
        .setColorBackground(color(125,  82,  35))
        .setColorForeground(color(253, 165,  70))
        .setColorActive(color(253, 202,  146));

    cp5.getController("slider_TEMP").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);


    // PH slider

    cp5.addSlider("slider_PH")
        .setPosition(420, 540)
        .setSize(200, 20)
        .setRange(2, 7) // values can range from big to small as well
        .setValue(targetPH)
        .setNumberOfTickMarks(6)
        .setSliderMode(Slider.FLEXIBLE)
        .setColorBackground(color(26,  77,  39))
        .setColorForeground(color(69,  205,  104))
        .setColorActive(color(136, 213,  156));

    cp5.getController("slider_PH").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0).setPaddingY(10);

}


void slider_RPM() {
  
  targetRPM = int(cp5.getController("slider_RPM").getValue());
  cp5.getController("set_RPM").setColorBackground(color(245, 34, 74));
 
}

void slider_TEMP() {
  
  targetTEMP = cp5.getController("slider_TEMP").getValue();
  cp5.getController("set_TEMP").setColorBackground(color(245, 34, 74));

}


void slider_PH() {
   
   targetPH = int(cp5.getController("slider_PH").getValue());
   cp5.getController("set_PH").setColorBackground(color(245, 34, 74));

}