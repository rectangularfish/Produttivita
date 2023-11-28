
PomodoroTimer timer;


color accent1 = color(34, 34, 34);

void setup() {
  size(1000, 600);
  timer = new PomodoroTimer(25, 5);
}


void draw() {

  background(accent1); // almost black looks clean

  fill(221, 221, 221); // almost white clean

  square(mouseX, mouseY, 100);
  timer.drawMe();
}
