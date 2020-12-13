class Widget {
  int x, y, width, height;
  String label; 
  int event;
  int widgetColor, labelColor;
  PFont widgetFont;
  boolean overButton = false;
  
  // empty constructor for a widget. 
  Widget() {}
  
  // Constructor of a widget. 
  // Parameters: x, y, width, height, label, labelColour, widgetColour, font and event.
  // No returns.
  // Sets all parameters to a variable. Done to display data as widgets. 
  Widget(int x, int y, int width, int height, String label, int labelColour,
    int widgetColor, PFont widgetFont, int event) {
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.label=label; 
    this.event=event;
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor= labelColour;
  }
  
  // draw the widget.
  public void draw() {
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
}
