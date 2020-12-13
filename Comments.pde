class Comments {
  //Maria. 
  private int[] kids; 
  String type; 
  String by;
  int time; 
  int id; 
  int parent;
  String text; 
  
  // Constructor for comments. Each line of the json obejct is assigned to a variable.
  // Done to be able to access all fields using get/set. 
  // Maria. 
  public Comments (int[] kids1, int parent1, String text1, int id1, int time1, String by1){
   if (kids == null) {
      this.kids = new int[0];
    } else {
      this.kids = kids1;
    }
    this.by = by1;
    this.time = time1;
    this.id = id1;
    this.parent = parent1;
    this.text = text1; 
  }
  
  // get kids field and store in int array.  
  public int[] getKids() {
    return kids;
  }

  // get parents field and store in variable type int. 
  public int getParent() {
    return parent;
  }

  // get text field and store in variable type string. 
  public String getText() {
    return text;
  }

  // get Id field and store in variable type int. 
  public int getId() {
    return id;
  }

  // get time field and store in variable type int. 
  public int getTime() {
    return time;
  }

  // get author field and store in variable type String. 
  public String getAuthor() {
    return by;
  }

}
