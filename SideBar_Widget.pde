class SideBar_Widget extends Widget {
  // Class done by Cormac.

  int width = SCREENX/15, height = (int)heightOfCanvas;
  int x =0, y=0;
  String label; 
  int event=-1;
  int widgetColor, labelColor;
  PFont widgetFont;
  boolean isOpen = false;
  ArrayList OptionList;
  Widget [] sideBar = new Widget[4];

  // SideBar components set up as an array because the amount of contents (4) is known and wont change.
  // Setup creates 4 new widgets, which are part of the array of Sidebar. 
  public void setup() {
    sideBar[0] = new Widget(40, 100, 250, 50, "Trending", 255, 100, f, 1);
    sideBar[1] = new Widget(40, 200, 250, 50, "Most Recent", 255, 100, f, 2);
    sideBar[2] = new Widget(40, 300, 250, 50, "Highest Voted", 255, 100, f, 3);
    sideBar[3] = new Widget(40, 400, 250, 50, "Stats", 255, 100, f, 4);
  }

  //  empty constructor. 
  SideBar_Widget() {
  }

  // draw the sidebar. Draws three small rectangles, for design purposes. 
  // No parameters or return values. 
  public void draw() {
    fill(midOrange);
    rect(0, 0, this.width, this.height);
    fill(lightOrange);
    rect(width-70, SCREENY/13, 50, 8, 4);
    rect(width-70, SCREENY/13-15, 50, 8, 4);
    rect(width-70, SCREENY/13-30, 50, 8, 4);
    if (isOpen == true) {
      drawTextOptions();
    }
  }

  // When sidebar is open, draw the array of widgets(sidebar options). 
  public void drawTextOptions() {
    textFont(f);
    textSize(25);
    for (int i = 0; i<sideBar.length; i++) {
      sideBar[i].draw();
    }
  }

  // Changes the size of the sidebar depending on whether the sidebar is open or closed.
  // no parameters or return values. 
  public void openClose() {
    if (this.isOpen == false) {
      width = width*4;
      //     x -= width-(width/4);
      isOpen = true;
      println("open");                          // defensive coding
    } else {
      this.width = width/4;
      //     x += width*3;
      isOpen = false;
      println("close");                         // defensive coding
    }
  }

  // Compares the position of mouse and position of the sidebar, to determine whether it should be opened or not when mouse is clicked. 
  // Parameters: x and y position of the mouse. 
  // Return: Boolean. if true, means that mouse is in the same position as sidebar. If false, means that positon of mouse is not the same as sidebar. 
  public boolean checkPress(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      print("SideBar");
      return true;
    } else
      return false;
  }

  // Compares the position of the mouse to the position of each item of the array of the sidebar.  
  // Parameters: the x and y position of the mouse. 
  // Return: a number, linked to which array member is pressed. This number is related to constants, which is then used in setupNewScreen() to show the corresponding screen. 
  public int checkOptions (int mX, int mY) {
    for (int index = 0; index<sideBar.length; index++) {
      if (mX>sideBar[index].x && mX < sideBar[index].x+sideBar[index].width && mY >sideBar[index].y && mY<sideBar[index].y+sideBar[index].height) {
        print(sideBar[index].label);                                                  //defensive coding
        return sideBar[index].event;
      }
    }
    return 0;
  }
}
