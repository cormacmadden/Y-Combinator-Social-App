//Cormac
class Card_Widget extends Widget {
  int cardColour = 255;
  String Title, Author, TitleShown;
  String url= "";
  int time;
  int score;
  int virtualY;
  Stories Story;
  Comments Comment;
  String text;
  boolean isStory;

  // card widget constructor. Gets the global values of fields and assigns them to local variables.
  // Done to be able to display the needed global variables of a a story on a card.  
  Card_Widget(int xpos, int ypos, int width, int height, Stories Story) {
    this.Story = Story;
    this.score = Story.score;
    this.Title = Story.title;
    this.url = Story.url;
    this.Author = Story.by;
    this.time = Story.time;
    TitleShown=Story.title;
    TitleShown = TitleShown.substring(0, Math.min(TitleShown.length(), 55));
    if(TitleShown.length()<Title.length()){
      TitleShown += "...";
    }
    x = xpos;
    y = ypos;
    virtualY = ypos;
    this.width = width;
    this.height = 2*height/3;
    isStory=true;
  }
  
   Card_Widget(int xpos, int ypos, int width, int height, Comments Comment) {
    this.Comment =Comment;
    this.text = Comment.text;
    this.Author = Comment.by;
    this.time = Comment.time;
    x = xpos;
    y = ypos;
    virtualY = ypos;
    this.width = width;
    this.height = 2*height/3;
    isStory = false;
  }
  
  // Drawing each card. 
  public void draw() {
    if (isStory == true){
    fill(cardColour);
    rect(x, y, width, height,7);
    noStroke();
    fill(0);
    textSize(30);
    text(TitleShown, x+(width/50), y+(height/2));
    textSize(20);
    text("By: "+ Author, x+(width/40), y+(height/5)*4);
    text("Score: "+ score, x+(width/40)*30, y+(height/5)*4);
    }
    else{
    fill(cardColour);
    rect(x, y, width, height+20);
    noStroke();
    fill(0);
    textSize(20);
    text(text, x+(width/50), y+(height/20),(width*49/50),(height));}
  }

  // If the x and y parameters of mouse and the same as such of the card, link to url of the news. 
  // Parameters: the x and y position of the mouse.
  // No return. 
  // KNOWN BUG: not correct coordination between x and y values when it has been scrolled down. 
  public void cardLink(int mX, int mY, SearchAlgorithm SortAlgorithm) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      println(Title);
      Screen = COMMENTS_PAGE;
      ActiveStory = Story;  //    link(url);
      SortAlgorithm.setupNewScreen();
    }
  }
  
  // If the x and y parameters of mouse and the same as such of the card, change colour of rectangle holding the news. 
  // Parameters: the x and y position of the mouse, rectangle.
  // No return. 
  public void hoverCard(int mX, int mY,ScrollRect rect) {
    if (mX>x && mX < x+width && mY >virtualY-rect.rectPosY && mY <virtualY+height-rect.rectPosY) {
      cardColour = 230;
    }
    else cardColour = 255;
  }
}
