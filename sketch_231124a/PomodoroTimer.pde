class PomodoroTimer {



  int studyTime, breakTime;
  boolean onBreak;


  int secondsDown;

  int timer;

  int interval; // 10 seconds
  
  color timerColor = color(80, 123, 88);



  PomodoroTimer(int st, int bt) {

    this.onBreak = false;
    this.studyTime = st;
    this.breakTime = bt;

    this.timer = millis();

    this.interval =  60000 * this.studyTime;
  }


  void drawMe() {


    if (millis() - timer > interval) {

      timer = millis();
    }

    int elapsedSeconds = (millis() - timer) / 1000;

    secondsDown = interval/1000 - elapsedSeconds;
    
    


    String minutes = str(secondsDown / 60);
    
    String seconds = str(secondsDown % 60);
    
    if (int(seconds) < 10) {
      
       seconds = "0" + seconds;
      
    }

    textAlign(CENTER);
    
    textSize(128);
    
    text(minutes + ":" + " " + seconds, width/2, height/2 + 25);


    noFill();

    stroke(timerColor);

    strokeWeight(30);
    
    
    
    println(secondsDown, 60 * this.studyTime);
    
   
    
    float angle = (secondsDown * 1.0 /  (60 * this.studyTime)) * 360;
    
    println(angle);

    arc(width / 2, height / 2, 400, 400, 0, radians(angle));

    noStroke();
  }
}
