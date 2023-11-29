
PomodoroTimer timer;


color accent1 = color(34, 34, 34);

color accent2 = color(221, 221, 221);

void setup() {
  size(1000, 600);
  timer = new PomodoroTimer(25, false);
}


void draw() {
  background(accent1); // almost black looks clean

  fill(accent2); // almost white clean




  timer.drawMe();


  if (timer.seconds == 0) {

    
    timer.setState(5, true);
    

  }
}
