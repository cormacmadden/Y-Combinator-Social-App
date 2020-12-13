// Button that allows the search to start.
// Class done by Cian. 

class SearchButton {
  int maxlen;
  int x, y, width, height; 
  String label; 
  int event; 
  int widgetColor, labelColor; 
  PFont widgetFont;
  
  // SearchButton constructor.
  // Parameters: x, y, width, height, label, widgetColor, font, event and maxlen. 
  // Gets the global variables and then uses them as variables for the search button.
  SearchButton(int x, int y, int width, int height, String label, int widgetColor, PFont font, int event, int maxlen) { 
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height; 
    this.label=label; 
    this.event=event; 
    this.widgetColor=widgetColor; 
    this.widgetFont=font; 
    labelColor=color(0); 
    this.maxlen=maxlen;
  }
  
  // Draw the button. Animations for when it is pressed. 
  // Search pressed is the global variable (in Main) that determines whether the position of the mouse is the same as the position of the button. 
  // Colour of the button changes when go is pressed. 
  public void draw() { 
    if (searchPressed == false)  //animation for when "go" is pressed
    {
    fill(widgetColor); 
    stroke(0);
    rect(x, y, width, height, 10);
    fill(labelColor); 
    }
    else if (searchPressed == true)
    {
    fill(200); 
    stroke(0);
    rect(x+3, y+3, width-6, height-6, 10);
    fill(labelColor); 
    }
    text(label, x+10, y+height-10);
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
