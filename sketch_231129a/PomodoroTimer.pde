class PomodoroTimer {
  
  
  
  
  boolean onBreak, timerStart;
  int t; 

  int totalFrames;

  color tColor;

  String minutesDisplay, secondsDisplay;

  int seconds, time;

  PomodoroTimer(int st, int bt, boolean oB) {

    if(oB == true) {
     
      
      t = bt;
      
      
    }
    else {
     
      t = st; 
      
    }


    setState(t, oB);
  }

  void setState(int t, boolean oB) {
    this.onBreak = oB;

    this.timerStart = false;

    this.totalFrames = 3600 * t + 1;

    frameCounter = 0;

    this.seconds = (totalFrames - frameCounter) / 60;

    this.time = t * 60;
    println("OB IS =" + oB);


    if (oB == false) {
      this.tColor =  color(80, 123, 88);
      println("Colour green");
    } else if (oB == true) {
      this.tColor = color(171, 49, 49);
      println("Colour red");
    }
  }








  void drawMe() {

    //println(this.timerStart);

    if (this.timerStart) {

      this.seconds = (totalFrames - frameCounter) / 60;
    }

    textSize(128);


    minutesDisplay = str(seconds / 60);
    secondsDisplay = str(seconds % 60);

    if (int(minutesDisplay) < 10) {

      minutesDisplay = "0" + minutesDisplay;
    }

    if (int(secondsDisplay) < 10) {

      secondsDisplay = "0" + secondsDisplay;
    }

    fill(accent2);
    textAlign(CENTER);
    text(minutesDisplay + ":" + secondsDisplay, width / 2, (height / 2) + 20);

    noFill();

    stroke(this.tColor);

    strokeWeight(30);

    float angle = (seconds * 1.0 /  (this.time)) * 360;

    arc(width / 2, height / 2, 400, 400, 0, radians(angle));
  }
}
