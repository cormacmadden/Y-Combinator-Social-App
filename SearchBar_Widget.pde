// Class done by Roisin. 
class SearchBarWidget { 
  int maxlen;
  int x, y, width, height; 
  String label; 
  int event; 
  int widgetColor, labelColor; 
  PFont widgetFont;
  
  // SearchBar constructor. 
  SearchBarWidget(int x, int y, int width, int height, String label, int widgetColor, PFont font, int event, int maxlen) { 
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
  
  // Allows user to add and delete letters. The length of the string is also updated with the correct amount of characters in it. 
  // Needed to type the search and in case the user makes an error. 
  // Parameter: a character. No return value.
  public void append(char s) { 
    if (s==BACKSPACE) { 
      if (!label.equals("")) label=label.substring(0, label.length()-1);
      return;
    } 
    else if (label.length() <maxlen) {
      label=label+str(s);
      return;
    }    
  } 

  // draw the search box. 
  public void draw() { 
    fill(widgetColor); 
    stroke(0);
    rect(x, y, width, height, 10); 
    fill(labelColor); 
    textSize(22);
    textFont(f);
    text(label, x+10, y+height-10);
  } 
  
  // Compares the position of the mouse to the position of the button. If they are the same, an event is raised. 
  // Parameters: the x and y position of the mouse. 
  // Return: an int value, related to whether the position is the same and a key has to be gathered and a search conducted. 
  public int getEvent(int mX, int mY) { 
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      focus = searchBar;     
      return event;
    } 
    return EVENT_NULL;
  }
  
  // 
  public void setLabel(String newLabel){
    label = newLabel;
  }
}
