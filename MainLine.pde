import org.gicentre.utils.stat.*;        // For chart classes.  
SearchAlgorithm SortAlgorithm = new SearchAlgorithm();
PFont myFont;
PFont f;
PFont headerFont;
ScrollRect scrollRect;        // the vertical scroll bar

SideBar_Widget theSideBar;
Stories ActiveStory;
ArrayList CardList;
int Screen = 2;

//searchBar
String SearchWord;
SearchBarWidget searchBar;
SearchBarWidget focus; 
SearchButton confirmSearch;
SearchTypeAuthor searchTypeAuthor;

//keys
int id;
float time;                                      // float to allow graph display
String by;
String type;
int[] kids = null; 
float descendants;                              // float to allow graph display
String url;
String title; 
int score;
int parent;
String text; 
boolean clickIsValid = false;
boolean searchPressed = false;
boolean toggleStatPressed = false;
boolean showToggleStatButton = false;
boolean searchesTitles = true;
String searchBarLabel = "click to search";


float period1 = 0; 
float period2 = 0; 
float period3 = 0; 
float period4 = 0; 
float period5 = 0; 


Stats chart;  
BarChart chartB;                                          // import BarChart function from GiCentre library

timeLine graph;
XYChart graphB;                                           // import XYChart function from GiCentre library

ToggleStatButton toggleStat; 

public void settings() {
  size(SCREENX, SCREENY);
}

// main setup of the program. 
// data is accessed from json file. Maria.
// all objects are created. Edited by all. 
public void setup () {
  
  String[] lines = loadStrings("news.json");                                 //converted each object to an array. size of array is 1000
  Stories stories;
  Comments comments;

  for (int i = 0; i < lines.length; i++)
  {
    JSONObject json = parseJSONObject(lines[i]);                            // for each line, parse to separate the different chunks. id, url....
    object.add(json);

    type = json.getString("type");
    if (type == null) {                                   // ignore JSONObjects that have no "type" key, cannot clasify. Defensive coding. 
      continue;
    }

    if (!json.isNull("kids")) {                                              // getting kids. storing in a kids array. 
      JSONArray kidsValues = json.getJSONArray("kids");
      kids = new int[kidsValues.size()];
      for (int k = 0; k < kidsValues.size(); k++) {
        kids[k] = kidsValues.getInt(k);
      }
    }

    if (type.equals("story")) {
      // call constructor in Stories class. Store the values, so they are available with the "get" functions. 
      stories = new Stories(kids, (json.isNull("descendants")) ? 0 : json.getInt("descendants"), json.getString("url"), 
        json.getString("title"), json.isNull("by") ? "N/A" : json.getString("by"), json.isNull("score") ? 0 : json.getInt("score"), json.isNull("time") ? 0 : json.getInt("time"), 
        json.getInt("id"));
      allStories.add(stories);                                                // add all stories to ArrayList. 
      
    } else if (type.equals("comment")) {
      // call constructor in Comments class.  Store the values, so they are available with the "get" functions. 
      comments = new Comments(kids, json.getInt("parent"), json.getString("text"), 
        json.getInt("id"), json.isNull("time") ? 0 : json.getInt("time"), json.isNull("by") ? "N/A" : json.getString("by"));
      allComments.add(comments);                                              // add all comments to ArrayList.                                         
    }
  }

  // Remove null element data. To avoid empty spaces and errorrs in the arrayList. 
  object.trimToSize();
  allStories.trimToSize();
  allComments.trimToSize();
  // to check that the whole JSONObject is extracted. Debugging purposes. 
  println("Total parsed: " + (allStories.size() + allComments.size()));               

// creation of all objects. Cormac. Cian. Roisin. Maria. 
  theSideBar = new SideBar_Widget();
  theSideBar.setup();
  
  headerFont = loadFont("Futura-MediumItalic-55.vlw");
  f = createFont("Arial", 16);
  myFont = loadFont("ArialMT-48.vlw");
  noStroke();

  chart = new Stats(); 
  graph = new timeLine(); 
 
  // cards are used to display news. In trending, recent, highest voted and search.
  CardList = new ArrayList();                                                                              
  searchBar =new SearchBarWidget(850, 30, 400, 60, searchBarLabel, color(255), f, SEARCH_BAR, 20);
  
  // creation of buttons. 
  searchTypeAuthor = new SearchTypeAuthor(730, 30, 100, 60, color(255, 230, 180), f, SEARCH_BAR);
  confirmSearch = new SearchButton(1280, 30, 60, 60, "GO", color(255, 230, 180), f, SEARCH_BAR, 20); 
  toggleStat = new ToggleStatButton(1280, 150, 100, 60, "Toggle Stat", color(255), f, SEARCH_BAR);
  
  SearchWord = null;
  
  init_sort_array(true);
  Screen = TRENDING_PAGE;
  // new screen created to display search results. 
  SortAlgorithm.setupNewScreen();                                         
  init_card_array(true);
  
  // scrolling capacity. 
  scrollRect = new ScrollRect();  
}

// draw all objects onto the interface. Edited by all. 
public void draw() {
  background(200);
  noStroke();
  // Cormac.
  if (Screen == MOST_RECENT_PAGE||
    Screen == HIGHEST_VOTED_PAGE||
    Screen == TRENDING_PAGE ||
    Screen == STORIES_PAGE||
    Screen == COMMENTS_PAGE) {
    cardScene();
  }
  if (Screen == STATS_PAGE) {
    statsScene();
  }
  
  //Header at top. Cian. 
  fill(darkOrange);
  rect(0, 0, SCREENX, SCREENY/8);    

  // Header title
  fill(lightOrange);  
  textFont(headerFont);
  text("HACKER  N E W S", SCREENX/10, SCREENY/12);

  //Sidebar
  theSideBar.draw();
  //Scroll 
  scrollRect.display();
  scrollRect.update();
  
  //Search in the header section. Roisin. 
  searchBar.draw();
  
  searchTypeAuthor.draw();

  confirmSearch.draw();
  
  // only show the 'change stat' button in th Stats page. Cian. 
  if (showToggleStatButton == true) {
    toggleStat.draw();
  } else if (showToggleStatButton == false) {
    return;
  }

}

// Display Trending, Recent and Highest Voted in Cards. Cormac. 
public void cardScene() {
  showToggleStatButton = false;
  pushMatrix();
  float newYValue = scrollRect.scrollValue();
  translate (0, newYValue);
  draw_card_array();
 // updateYValue(scrollRect.rectPosY);
  popMatrix();
}

// Display the graphs in stats page. Maria. 
public void statsScene() {
  showToggleStatButton = true;
   println("StatsScreen");
   pushMatrix();
   float newYValue = scrollRect.scrollValue();  
   translate (0, newYValue);
   if (toggleStatPressed == false) {
      graph.setup();
      graph.draw();   
   
    } else if (toggleStatPressed == true) {
     chart.setup();
     chart.draw();
    }

   popMatrix();

}


// Sorting function. Create an array that will be used to sort the data into various requests. Cormac. 
// Done to create the queries. 
public void init_sort_array(boolean isStory) {
  SortedList.clear();
  for (int index = 0; index<allStories.size(); index++) {
    if(isStory ==true){
    Stories aStory = (Stories) allStories.get(index);
    SortedList.add(index, aStory);
    }
    else{
    Comments aComment = (Comments) allComments.get(index);
    SortedList2.add(index, aComment);}
  }
}

// Draw 10 cards into the screen Cormac. Modified by Roisin
public void draw_card_array() {
  if (CardList.size()>=10) {
    for (int i = 0; i<10; i++) {
      Card_Widget aCard = (Card_Widget) CardList.get(i);
      aCard.draw();
    }
  } else {
    for (int i = 0; i<CardList.size(); i++) {
      Card_Widget aCard = (Card_Widget) CardList.get(i);
      aCard.draw();
    }
  }
}


// Initialize the 10 cards by creating and storing Card Widgets in them. Cormac. Modified by Roisin
// EXCEPTION RISEN: IndexOutOfBoundsException: Index: 0, Size: 0
public void init_card_array(boolean isStory) {
  print("init_card_array");
  CardList.clear();
  if (isStory == true) {

    if (SortedList.size()>=10) {
      for (int i=0; i<10; i++) {
        CardList.add(new Card_Widget(SCREENX/8, SCREENY/6+i*(SCREENY/8), (SCREENX/12)*8, SCREENY/8, SortedList.get(i)));
      }
    } else {
      for (int i=0; i<SortedList.size(); i++) {
        CardList.add(new Card_Widget(SCREENX/8, SCREENY/6+i*(SCREENY/8), (SCREENX/12)*8, SCREENY/8, SortedList.get(i)));
      }
    }
  }
    else{
  for (int i=0; i<10; i++) {
     if(SortedList2.size()>0){
    CardList.add(new Card_Widget(SCREENX/8, SCREENY/6+i*(SCREENY/8), (SCREENX/12)*8, SCREENY/8, SortedList2.get(i)));
  }}}
}

// Sidebar, Cards, Search and Buttons can be pressed on. 
// Here we specify what happens when each of these elements are pressed. 
public void mousePressed() {
  scrollRect.mousePressedRect();
  //Check if Sidebar is pressed and open sidebar. Cormac. 
  if (theSideBar.isOpen == true) {
    Screen = theSideBar.checkOptions(mouseX, mouseY);
    SortAlgorithm.setupNewScreen();
  }
  //if Sidebar pressed when sidebar is already open, close it. 
  if (theSideBar.checkPress(mouseX, mouseY)==true) {      
    theSideBar.openClose();
  } else {
    //Check is a card is pressed. Cormac. 
    // If x and y coordinates of a card match x and y coordinates of mouse, link. 
    for (int i = 0; i<CardList.size(); i++) {
      Card_Widget aCard = (Card_Widget) CardList.get(i);
      aCard.cardLink(mouseX, mouseY,SortAlgorithm);
    }
  }
  
  //search bar. Roisin. 
  int event;
  event = searchBar.getEvent(mouseX, mouseY); 
  if (event == SEARCH_BAR) {
    clickIsValid = true;
    println("Enter the text");
    searchBar.setLabel("");
    focus = searchBar;
  } else if (clickIsValid == false) { 
    focus=null;
  }
  
  // 'Go' button.  Cian. 
  int searchConfirmedEvent;
  searchConfirmedEvent = confirmSearch.getEvent(mouseX, mouseY);
  if (searchConfirmedEvent == CONFIRM_SEARCH) {
    searchPressed = true;
  } else {
    searchPressed = false;
  }

int toggleStatEvent;
  toggleStatEvent = toggleStat.getEvent(mouseX, mouseY);
  if (toggleStatEvent == CONFIRM_TOGGLE_STAT && toggleStatPressed == false) {   
    toggleStatPressed = true;
    draw();
    
  } else if (toggleStatEvent == CONFIRM_TOGGLE_STAT && toggleStatPressed == true) {
    toggleStatPressed = false;
    draw();
  }
  

  searchTypeAuthor.checkPress(mouseX, mouseY);

  
}


// Show results for search when 'Go' is pressed. 
// No parameters passed. No return values.
// Cian and Roisin. 
public void keyPressed() { 
  if (focus != null) { 
    if ((key == ENTER ) && (searchBar.label != null) ) {
      SearchWord = searchBar.label;        //the searchWord = the word entered
      Screen = STORIES_PAGE;               //the Screen to show from now on is the Stories from the search
      SortAlgorithm.setupNewScreen();      //clear the old cards
    } else {
      focus.append(key);
    }
  }
}

// Search conducted. When the mouse is released, the searching begins.  
public void mouseReleased() {
  scrollRect.mouseReleasedRect();
  int searchConfirmedEvent;
  searchConfirmedEvent = confirmSearch.getEvent(mouseX, mouseY);
  searchPressed = false;
  if (searchConfirmedEvent == CONFIRM_SEARCH) {
    clickIsValid = true;
    SearchWord = searchBar.label;
    Screen = STORIES_PAGE;
    SortAlgorithm.setupNewScreen();
    println("search confirmed");                  // defensive coding. 
  } else if (clickIsValid == false) {
    focus = null;
  }
}

// Check for whether a card has been hovered over by the mouse. 
// Cormac. 
public void mouseMoved() {
  for (int i = 0; i<CardList.size(); i++) {
    Card_Widget aCard = (Card_Widget) CardList.get(i);
    aCard.hoverCard(mouseX, mouseY, scrollRect);
  }
}
