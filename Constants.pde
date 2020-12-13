
color darkOrange = color(200, 100, 10);
color midOrange = color(230, 140, 10);
color lightOrange = color(255, 230, 180);

int currentTime = 1160418111;

final int SCREENX = 1400;
final int SCREENY = 1000;
final int EVENT_NULL=0;
final int EVENT_BUTTON1=1;
final int SIDEBAR_EVENT=-1;
final int TRENDING_PAGE = 1;
final int MOST_RECENT_PAGE = 2;
final int HIGHEST_VOTED_PAGE = 3;
final int STATS_PAGE = 4;
final int STORIES_PAGE = 5;
final int COMMENTS_PAGE = 6;
final int SEARCH_BAR=1;
final int CONFIRM_SEARCH=1; 
final int CONFIRM_TOGGLE_STAT = 1; 
float heightOfCanvas = 3000;  // realHeight of the entire scene  

ArrayList<JSONObject> object = new ArrayList<JSONObject>();
ArrayList<Comments> allComments = new ArrayList<Comments>();
ArrayList<Stories> allStories = new ArrayList<Stories>(); 
ArrayList<Stories> SortedList = new ArrayList<Stories>();
ArrayList<Comments> SortedList2 = new ArrayList<Comments>();
MainLine[] news;
JSONObject json;
JSONArray idList;
