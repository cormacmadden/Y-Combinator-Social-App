// Creates a rectangle which is the scroll bar. When the rectangle is pressed on, screen scrolls. 
// Cormac. (Credit to Chrisir from Processing forums website)

class ScrollRect {
  float rectPosX=0;
  float rectPosY=0;
  float rectWidth=14; 
  float rectHeight=60;

  boolean holdScrollRect=false; 
  float offsetMouseY; 

  //constructor. No parameters taken in. 
  ScrollRect() {
    rectPosX=width-rectWidth-1;
  }

 // Display the rectangle in the designated position.
 // Noparameters taken in and no return. 
  public void display() {
    fill(150);
    //  stroke(0);
    // line (rectPosX-1, 0, 
    //   rectPosX-1, height);
    stroke(75);
    rect(rectPosX, rectPosY, 
      rectWidth, rectHeight, 10);

    // Three small lines in the center. Design purpose. 
    centerLine(-3); 
    centerLine(0);
    centerLine(3);
  }

  // Change the position of the rectangle. 
  // Parameter: Offset, the change in position.
  // No return value. 
  public void centerLine(float offset) {
    line(rectPosX+3, rectPosY+rectHeight/2+offset, 
      rectPosX+rectWidth-3, rectPosY+rectHeight/2+offset);
  }
  
  // Needed to update the offset. 
  public void mousePressedRect() {
    if (mouseOver()) {
      holdScrollRect=true;
      offsetMouseY=mouseY-rectPosY;
    }
  }
  
  // When mouse is released, offset does not have to be updated anymore. 
  public void mouseReleasedRect() {
    scrollRect.holdScrollRect=false;
  }

  // Make sure the rectangle stays inside of the screen. 
  // Update the position of the screen. 
  public void update() {
    // dragging of the mouse 
    if (holdScrollRect) {
      rectPosY=mouseY-offsetMouseY;
      if (rectPosY<0)
        rectPosY=0;
      if (rectPosY+rectHeight>height-1)
        rectPosY=height-rectHeight-1;
    }
  }

  // No parameters.
  // Return: map of type float which contains the updated position of the screen, 
    public float scrollValue() {
      return
        map(rectPosY, 
        0, height-rectHeight, 
        0, - (heightOfCanvas - height));
    }

    // make sure only the rectangle and screen change position when the mouse clicked occurs inside of the rectangle.
    // compares position of rectangle and position of mouse.
    // return: Boolean. 
    // true if position of rectangle and position of mouse are equal. False if position of rectangle and position of mouse are different. 
    public boolean mouseOver() {
      return mouseX>rectPosX&&
        mouseX<rectPosX+rectWidth&&
        mouseY>rectPosY&&
        mouseY<rectPosY+rectHeight;
    } 
    
  }
