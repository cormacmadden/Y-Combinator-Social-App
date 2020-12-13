// button to change between two stories. 
// Cian. 

  
class ToggleStatButton {
  int maxlen;
  int x, y, width, height; 
  String label; 
  int event; 
  int widgetColor, labelColor; 
  PFont widgetFont;
  
  // ToggleStatButton constructor. 
  // The properties of the button. 
  // Parameters: x, y, width, height, label, color, font, event. 
  // Sets all parameters to a variable. Done to change between graphs. 
  
  ToggleStatButton(int x, int y, int width, int height, String label, int widgetColor, PFont font, int event) { 
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height; 
    this.label=label; 
    this.event=event; 
    this.widgetColor=widgetColor; 
    this.widgetFont=font; 
    labelColor=color(0); 
  }
  public void draw() { 
    if (toggleStatPressed == false)  //animation for when "go" is pressed
    {
    fill(widgetColor); 
    stroke(0);
    rect(x, y, width, height, 10);
    fill(labelColor); 
    }
    else if (toggleStatPressed == true)
    {
    fill(200); 
    stroke(0);
    rect(x+3, y+3, width-6, height-6, 10);
    fill(labelColor); 
    }
    text(label, x+10, y+height-10);
  } 
  public int getEvent(int mX, int mY) { 
    if (mX>x && mX < x+width && mY >y && mY <y+height) {     
    return event;
    } 
    return EVENT_NULL;
  }
}
