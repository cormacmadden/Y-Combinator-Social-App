// This class generates a graph of time against score. Displays the score of the stories against time. 
// Used to know the time period when stories were more popular (higher score).
// Useful to know when the best time to do a nes story is, if you want it to be popular. 
// Class done by Maria. 

class timeLine {
  XYChart lineChart;
  
  public void settings() {
  size(500, 200);
}

// Functions of GiCentreUtils library used to add characteristics to the bar chart. 
  void setup()
{
   scrollRect.display();
  scrollRect.update();
  noStroke();
    // get the time and the score for all stories and store in an array of the size of total amount of stories. 
    // Why? GiCentre utils only supports data that is entried as float arrays.
  float[] time1 = new float[allStories.size()];  
   for (int i=0; i<time1.length; i++) {
      time1[i] = allStories.get(i).time;
    }

    
    float[] score1 = new float[allStories.size()];  
     for (int i=0; i<score1.length; i++) {
      score1[i] = allStories.get(i).score;
    }
    
  textFont(createFont("Arial",20),10);
   lineChart = new XYChart(MainLine.this);
  // Both x and y data set here.  

  lineChart.setData(time1, score1);
   
  // Axis formatting and labels.
  lineChart.showXAxis(true); 
  lineChart.showYAxis(true); 
  lineChart.setMinY(0);
     
  lineChart.setYFormat("###,###");   // Format of score
  lineChart.setXFormat("0000");      // Year
   
  // Symbol colours
  lineChart.setPointColour(color(180,50,50,100));
  lineChart.setPointSize(5);
  lineChart.setLineWidth(1);
}
 
// Draws the chart and a title.
void draw()
{
  background(255);
  textSize(9);
  
  // Draw a title over the top of the chart.
  fill(120);
  textSize(40);
  text("When did stories have highest scores?", 400,200);
  fill(255); stroke(0);
  rect(250, 910, 1000, 170, 15);
  textSize(20);
  fill(120);
  text("This graph can be used to identify the times with highest enegagement. This tool is very useful for future " + "\n" +
  "authors, as they can analyze the days and hours when stories score the highest values. Authors will then " + "\n" +
  " have a better idea of when the best moment to post is, in order to rise their popularity. Readers can use " + "\n" +
  "this tool to track when they read the news most often and to predict when new posts are likely to be published. ",  270,950);
  textSize(11);      
  lineChart.draw(250,250,width-400,height-400);
   
  
}
}
