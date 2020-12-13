// This class generates a bar chart of score against stories. Groups score into 5 groups, and displays the amount of stories in each group of scores. 
// Used to know the average score of stories ( authors can use it to predict the score they are likely to get).
// Maria. 

class Stats{

BarChart chart;                                                           // Create a chart of type BarChart, imported from GiCentreUtils library. 

public void settings() {
  size(500, 200);
}

// Functions of GiCentreUtils library used to add characteristics to the bar chart. 
void setup() {
  group_time(); 
  scrollRect.display();
  scrollRect.update();
  noStroke();
  chart = new BarChart(MainLine.this);
  chart.setData(new float[] {2008, 524, 113, 72, 84});
  chart.setBarLabels(new String[] {"0-4","5-9","10-14","15-19","20++"});
  chart.setBarColour(color(255,165,0,100));
  chart.setBarGap(2); 
  chart.showValueAxis(true); 
  chart.showCategoryAxis(true);
  chart.setMinValue(0);
  chart.setMaxValue(3000);
}
  
// Draws the chart, in a set position and of a set size. 
void draw() {

  background(255); 
  //chart(); 
  
  chart.draw(200,300,width-400,height-400); 
  
  //draw a title 
  fill(120);
  textSize(30);
  text("Scores of stories", 200, 200);
}

// Grouping into score groups.
// Go through the score value of allStories arrayList and increment the count if the if statement is satisfied (ie the story has a score in that score group)
// No parameters and no return values.
// Maria. 

public void group_time() {
  for (int i=0; i<allStories.size(); i++) {

      if (allStories.get(i).score < 5 && allStories.get(i).score > 0) {
        period1++;  
        println(period1); 

      }
      else if (allStories.get(i).score < 10 && allStories.get(i).score >= 5) {
        period2++;
        println(period2); 
              
      }
      else if(allStories.get(i).time >= 10 && allStories.get(i).score < 15 ) {
        period3++;
        println(period3); 

      }
      else if(allStories.get(i).score >= 15 && allStories.get(i).score < 20 ) {
          period4++;
          println(period4); 
               
      }
      else if(allStories.get(i).score >= 20 ) {
          period5++;
          println(period5); 
 
      }
    }
}
}
