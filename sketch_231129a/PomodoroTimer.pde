class PomodoroTimer {
  
  
  
  // bool indicating whether it's break time and if the timer is running
  boolean onBreak, timerStart;
  
  // time-related fields
  int t, totalFrames, seconds, time; 

  // color representing the timer state
  color tColor;
  
  
  // formatted time display
  String minutesDisplay, secondsDisplay;


  // constructor
  PomodoroTimer(int st, int bt, boolean oB) {

    
    // set initial time based on whether it is break time
    if(oB == true) {      
      t = bt;   
    }
    else {   
      t = st;       
    }

    // initialize the state of the timer
    setState(t, oB);
  }
  
  
  // set the state of the timer
  void setState(int t, boolean oB) {
      
    this.onBreak = oB;

    this.timerStart = false;
    
    // calculates total frames based on time
    this.totalFrames = 3600 * t + 1;

    frameCounter = 0;

    this.seconds = (totalFrames - frameCounter) / 60;
    
    
    // calculate total time in seconds
    this.time = t * 60;

    // set color based on break or study time
    if (oB == false) {
      this.tColor =  color(80, 123, 88);
      println("Colour green");
    } else if (oB == true) {
      this.tColor = color(171, 49, 49);
      println("Colour red");
    }
  }







  // draw timer on screen
  void drawMe() {

    
    
    // update the timer if it is running
    if (this.timerStart) {

      this.seconds = (totalFrames - frameCounter) / 60;
    }

    textSize(128);

    // format minutes and seconds display
    minutesDisplay = str(seconds / 60);
    secondsDisplay = str(seconds % 60);
    
    
    // add leading zeros to minutes and seconds if less than 10
    if (int(minutesDisplay) < 10) {

      minutesDisplay = "0" + minutesDisplay;
    }

    if (int(secondsDisplay) < 10) {

      secondsDisplay = "0" + secondsDisplay;
    }

    fill(accent2);
    textAlign(CENTER);
    
    // display formatted time
    text(minutesDisplay + ":" + secondsDisplay, 800, (height / 2) + 20);

    noFill();

    stroke(this.tColor);

    strokeWeight(30);
      
    
    // calculate angle for the timer's visual representation
    float angle = (seconds * 1.0 /  (this.time)) * 360;
    
    
    // draw an arc representing the remaining time
    arc(800, height / 2, 400, 400, 0, radians(angle));
  }
}
