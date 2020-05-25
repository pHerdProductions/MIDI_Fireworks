/* 
Ralph Sabatino
'CustomFireworks.pde'   --   Create custom fireworks for 'MIDI_Fireworks.pde'
*/

// ------------ GLOBALS -------------
PrintWriter output;

PFont f;

int FR = 30;

/*IntList pointsX = new IntList();
IntList pointsY = new IntList();
IntList colR = new IntList();
IntList colG = new IntList();
IntList colB = new IntList();*/

String myString = "{";

int R = 255, G = 0, B = 0;

float size = 10.0;

int mouseOverThis = 0;
int temp;

void setup(){ // ---------------------------- SETUP -----------------------
  
  output = createWriter("myFireworks.txt"); 
  
  f = createFont("Arial", 15, true);
  textFont(f);
  
  fullScreen(P2D);
  frameRate = FR;
  background(0);
  
  stroke(255);
  line(width/2, (height/2)+25, width/2, (height/2)-25);
  line((width/2)+25, height/2, (width/2)-25, height/2);
  
  fill(0, 255, 0);
  text("Press the 'Enter' ( or 'Return' for Macs ) key to save and close. Press the 'S' key to save and start a new firework.", 5, 30);
  
  fill(255);
  
}

void draw(){ // --------------------- MAIN DRAW ----------------------------
    
  stroke(255);
  fill(0);
  rect(width-500, -5, 500, 140);

  fill(255);
  textAlign(RIGHT);
  
  text("Red:", width-300, 30);
  line(width-280, 23, width-25, 23);
  rect(width-280+R, 15, 10, 15);
  
  text("Green:", width-300, 60);
  line(width-280, 53, width-25, 53);
  rect(width-280+G, 45, 10, 15);
  
  text("Blue:", width-300, 90);
  line(width-280, 83, width-25, 83);
  rect(width-280+B, 75, 10, 15);
  
  text("Size:", width-300, 120);
  line(width-280, 113, width-160, 113);
  rect(width-280+size, 105, 10, 15);
  
  fill(R, G, B);
  noStroke();
  circle(width-420, 65, size);
  
}

void mouseClicked(){ // -------------- ADDING POINTS TO CANVAS AND myString -------------
  
  
  if(mouseOverThis == 0){
    
    noStroke();
    circle(mouseX, mouseY, size);
    
    /*pointsX.append(mouseX-(width/2));
    pointsY.append(mouseY-(height/2));
    
    colR.append(R);
    colG.append(G);
    colB.append(B);*/
    
    if(myString != "{"){
      myString += ", ";
    }
    
    myString += "{" + (mouseX-(width/2)) + "," + (mouseY-(height/2)) + "," + R + "," + G + "," + B + "," + size + "}";
    
  }
  
}

void mouseDragged(){ // --------------- FOR OUR rgb SLIDERS ------------------
  
  if(mouseOverThis == 1){
    
    temp = mouseX-width+275;
    if(temp > 255){
      R = 255;
    }
    else if(temp < 0){
      R = 0;
    }
    else{
      R = temp;
    }
        
  }
  else if(mouseOverThis == 2){
    
    temp = mouseX-width+275;
    if(temp > 255){
      G = 255;
    }
    else if(temp < 0){
      G = 0;
    }
    else{
      G = temp;
    }
        
  }
  else if(mouseOverThis == 3){
    
    temp = mouseX-width+275;
    if(temp > 255){
      B = 255;
    }
    else if(temp < 0){
      B = 0;
    }
    else{
      B = temp;
    }
        
  }
  else if(mouseOverThis == 4){
    
    temp = mouseX-width+275;
    if(temp > 120){
      size = 120;
    }
    else if(temp < 1){
      size = 1;
    }
    else{
      size = temp;
    }
        
  }
  
}

void keyPressed() { // ---------------------- FOR SAVING DATA AND EXITING ------------------

  if(keyCode == ENTER || keyCode == RETURN){
    
    myString += "}";
    
    output.println(myString);
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
    
    exit(); // Stops the program
    
  }
  
  if(key == 's' || key == 'S'){
    
    myString += "}";
    
    output.println(myString);
    
    /*pointsX.clear();
    pointsY.clear();
    colR.clear();
    colG.clear();
    colB.clear();*/
    
    background(0);
    stroke(255);
    line(width/2, (height/2)+25, width/2, (height/2)-25);
    line((width/2)+25, height/2, (width/2)-25, height/2);
    fill(0, 255, 0);
    textAlign(LEFT);
    text("Press the 'Enter' ( or 'Return' for Macs ) key to save and close. Press the 'S' key to save and start a new firework.", 5, 30);
    fill(255);
    myString = "{";
    
  }
  
}

void mouseMoved(){ // --------------------- FOR CHECKING IF WE'RE OVER OUR SLIDERS ----------

  if(mouseX < width-500 && mouseY > 140){
    mouseOverThis = 0;
  }
  else if(mouseX >= width-280 && mouseX <= width-280+255 && mouseY >= 15 && mouseY <= 25){
    mouseOverThis = 1;
  }
  else if(mouseX >= width-280 && mouseX <= width-280+255 && mouseY >= 35 && mouseY <= 55){
    mouseOverThis = 2;
  }
  else if(mouseX >= width-280 && mouseX <= width-280+255 && mouseY >= 65 && mouseY <= 85){
    mouseOverThis = 3;
  }
  else if(mouseX >= width-280 && mouseX <= width-280+255 && mouseY >= 95 && mouseY <= 115){
    mouseOverThis = 4;
  }
  else if(mouseX >= width-500 && mouseY <= 140){
    mouseOverThis = 5;
  }
  
}
