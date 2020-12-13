class Screen {
  ArrayList screenWidgets;
  int screenColor;
  
  // Constructor. 
  // Creates an arrayList where we will add all widgets to be printed to the screen. 
  // Parameter: color of the screen. No return.
  // Cian
  Screen(int in_color) {
    screenWidgets=new ArrayList();
    screenColor = in_color;
  }
  
  // Add all the widgets that have to be printed to the screen to the arrayList.
  // Parameter: Widget w. Takes in the widget to add. 
  // No return. 
  // Cian
  public void add(Widget w) {
    screenWidgets.add(w);
  }

  // Print the arrayList of widgets to the Screen. 
  // No parameters or return values. 
  public void draw() {
    background(screenColor);
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget)screenWidgets.get(i);
      aWidget.draw();
    }
  }
}
