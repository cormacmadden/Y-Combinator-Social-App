// Class done by Cian.
// Button saying the type of search that is being conducted. 
class SearchTypeTitle { 
  int maxlen;
  int x, y, width, height; 
  String label; 
  int event; 
  int widgetColor, labelColor; 
  PFont widgetFont;
  
  // SearchType constructor. 
  // The properties of the button. 
  // Parameters: x, y, width, height, label, color, font, event. 
  // Sets all parameters to a variable. Done to display the type of search. 
  SearchTypeTitle(int x, int y, int width, int height, String label, int widgetColor, PFont font, int event) { 
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
  
  // draw the box saying the type of search that is being done. 
   public void draw() { 
    fill(widgetColor); 
    stroke(0);
    rect(x, y, width, height, 10); 
    fill(labelColor); 
    text(label, x+15, y+height-25);
   }
    // Parameters: the x and y position of the mouse. 
  // Compares the position of the mouse to the position of the button. If they are the same, an event is raised. 
  public int getEvent(int mX, int mY) { 
    if (mX>x && mX < x+width && mY >y && mY <y+height) { 
      return event;
    } 
    return EVENT_NULL;
  }
}
