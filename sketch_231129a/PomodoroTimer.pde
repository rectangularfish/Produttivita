class PomodoroTimer {



  boolean onBreak, timerStart;


  int totalFrames;

  color tColor; 

  String minutesDisplay, secondsDisplay;

  int seconds;


  int studyTime;

  PomodoroTimer(int t, boolean oB) {
    this.onBreak = false;
    this.timerStart = true;

    this.studyTime = t;


    this.totalFrames = 3600 * t + 1;

    this.seconds = (totalFrames - frameCount) / 60;

    if (oB == false) {

      this.tColor =  color(80, 123, 88);
    } else {
      this.tColor = color(171, 49, 49);
    }
  }




  void drawMe() {

    if (timerStart) {

      this.seconds = (totalFrames - frameCount) / 60;
    }

    textSize(128);


    println(this.seconds);



    minutesDisplay = str(seconds/60);
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

    float angle = (seconds * 1.0 /  (60 * this.studyTime)) * 360;




    arc(width / 2, height / 2, 400, 400, 0, radians(angle));
  }
  
  void setBreak() {
    
    
    
    
    
  }
  
}
