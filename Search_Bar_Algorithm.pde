// By Roisin and Cormac.
class SearchAlgorithm {
  String FoundTitle ="";

  // empty constructor. 
  SearchAlgorithm() {
  }

  // Sorts the 'SortedList' Array to display the Stories by a given author
  // Roisin, Cormac
  public void sort_card_array_AuthorSearch() {
    Stories temp;
    for (int i = 0; i<allStories.size(); i++) {
      String name = (String) allStories.get(i).getAuthor();
      if (name !=null && !name.equals("") && name.equals(SearchWord)) {
        println("Story: " + i);
        temp = (Stories) allStories.get(i);
        SortedList.add(temp);
      }
    }
  }
  // Sorts the 'SortedList' Array to display the Stories by a given author
  // Roisin, Cormac
  public void sort_card_array_TitleSearch() {
    Stories temp;
    print(SearchWord);
    for (int i = 0; i<allStories.size(); i++) {
      String title1 = (String) allStories.get(i).title;
      if (title1 !=null && !title1.equals("") &&title1.contains(SearchWord)==true) {
        println("Story: " + i);
        temp = (Stories) allStories.get(i);
        SortedList.add(temp);
      }
    }
  }
   public void sort_card_array_comments(Stories aStory) {
    Comments temp;
    for(int j =0; j<aStory.getKids().length;j++){
     for (int i=0; i<allComments.size(); i++) {
        if(allComments.get(i).id == aStory.getKids()[j]){
          temp = (Comments) allComments.get(i);
          SortedList2.add(temp);
        }
     }
    }
    for (int i=0; i<SortedList2.size(); i++) {
      for (int j = i+1; j<SortedList2.size(); j++) {
        if (SortedList.get(i).time>SortedList2.get(j).time) {
          temp = (Comments) SortedList2.get(i);
          SortedList2.set(i, SortedList2.get(j));
          SortedList2.set(j, temp);
        }
      }
    }
  }
  
  //Organises the 'SortedList' so that the Stories are saved from most to least recent
  //Cormac
  public void sort_card_array_time() {
    Stories temp;
    for (int i=0; i<allStories.size(); i++) {
      for (int j = i+1; j<allStories.size(); j++) {
        if (SortedList.get(i).time>SortedList.get(j).time) {
          temp = (Stories) SortedList.get(i);
          SortedList.set(i, SortedList.get(j));
          SortedList.set(j, temp);
        }
      }
    }
  }

  //Organises the 'SortedList' so that the Stories with the most comments in the last week are saved
  //Cormac
  public void sort_card_array_trending() {
    Stories temp;
    for (int i=0; i<allStories.size(); i++) {
      for (int j = i+1; j<allStories.size(); j++) {
        if (SortedList.get(i).descendants<SortedList.get(j).descendants) {
          temp = (Stories) SortedList.get(i);
          SortedList.set(i, SortedList.get(j));
          SortedList.set(j, temp);
        }
      }
    }
    for (int i = 0; i<SortedList.size(); i++) {
      if (SortedList.get(i).time > currentTime - 604800) {
        SortedList.remove(i);
      }
    }
  }

  //Organises the 'SortedList' so that stories rank from highest to lowest scoring
  //Cormac
  public void sort_card_array_score() {
    Stories temp;
    for (int i=0; i<allStories.size(); i++) {
      for (int j = i+1; j<allStories.size(); j++) {
        if (SortedList.get(i).score<SortedList.get(j).score) {
          temp = (Stories) SortedList.get(i);
          SortedList.set(i, SortedList.get(j));
          SortedList.set(j, temp);
        }
      }
    }
  }
  //Tests whether there is a title after a search
  //Roisin
  public boolean titleFound() {
    if (FoundTitle != null) {
      return true;
    }
    return false;
  }

  // Queries are created and called.  
  // For each item in the array, sorting functions are called and the data is displayed in the corresponding order in cards. 
  // 
  public void setupNewScreen() {
    if (Screen == MOST_RECENT_PAGE) {
      init_sort_array(true);
      sort_card_array_time(); 
      init_card_array(true);
    }
    if (Screen == HIGHEST_VOTED_PAGE) {
      init_sort_array(true);
      sort_card_array_score(); 
      init_card_array(true);
    }
    if (Screen == TRENDING_PAGE) {
      init_sort_array(true);
      sort_card_array_trending(); 
      init_card_array(true);
    }
    if (Screen == STORIES_PAGE) {
      SortedList.clear();
      if (searchesTitles == false) {
        sort_card_array_AuthorSearch();
      } else if (searchesTitles == true) {
        sort_card_array_TitleSearch();
      }
      init_card_array(true);
    }
    if (Screen == COMMENTS_PAGE){
      print("setupNewScreen");
      SortedList2.clear();
      sort_card_array_comments(ActiveStory);
      init_card_array(false);  
  }
  }
}
