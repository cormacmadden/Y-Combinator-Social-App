// Class done by Maria. 
// Store all the stories. 
class Stories {
  int[] kids; 
  String type; 
  String by;
  int time; 
  int id;
  int descendants;
  String url; 
  String title; 
  int score; 
  
   // Constructor for stories. Each line of the json obejct is assigned to a variable.
  // Done to be able to access all fields using get/set. 
  public Stories(int[] kids1, int descendants1, String url1, String title1, String by1, 
  int score1, int time1, int id1) {
    this.kids = kids1;
    this.by = by1;
    this.time = time1;
    this.id = id1;
    this.descendants = descendants1;
    this.url = url1;
    this.title = title1;
    this.score = score1;
  }
  
  // get kids field and store in int array.  
  public int[] getKids() {
    return kids;
  }

// get descendants field and store in variable type int. 
  public int getDescendants() {
    return descendants;
  }

// get url field and store in variable type String.
  public String getURL() {
    return url;
  }

// get title field and store in variable type String.
  public String getTitle() {
    return title;
  }
  
  // get score field and store in variable type int.
  public int getScore() {
    return score;
  }

// get time field and store in variable type int.
  public int getTime() {
    return time;
  }

// get id field and store in variable type int.
  public int getId() {
    return id;
  }

// get author field and store in variable type String.
  public String getAuthor() {
    return by;
  }
  
}
