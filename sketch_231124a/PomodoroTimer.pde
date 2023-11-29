class PomodoroTimer {



  boolean onBreak, timerStart;


  int totalFrames;

  color timerColor = color(80, 123, 88);

  String minutesDisplay, secondsDisplay;

  int seconds;

  int secondsDown;

  int studyTime;

  PomodoroTimer(int st, int bt) {
    this.onBreak = false;
    this.timerStart = true;

    this.studyTime = st;


    this.totalFrames = 3600 * st + 1;

    seconds = (totalFrames - frameCount) / 60;
  }




  void drawMe() {

    if (timerStart) {

      seconds = (totalFrames - frameCount) / 60;
    }
  
    textSize(128);




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
     
     stroke(timerColor);

    strokeWeight(30);
    
    float angle = (seconds * 1.0 /  (60 * this.studyTime)) * 360;
    
    
    
    
    arc(width / 2, height / 2, 400, 400, 0, radians(angle));




    
  }
}
