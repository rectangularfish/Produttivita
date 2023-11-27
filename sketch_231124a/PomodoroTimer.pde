class PomodoroTimer {
  
  
  
 int studyTime, breakTime;
 boolean onBreak;
 
 int currentTime;
 
 
 
 PomodoroTimer(int st, int bt) {
   
  this.onBreak = false;
  this.studyTime = st;
  this.breakTime = bt;

 }
  
  
 void drawMe() {
   //fill(80, 123, 88);
   
   noFill();
   
  stroke(80, 123, 88);
  
  strokeWeight(30);
   
   arc(width / 2, height / 2, 300, 300, 0, TWO_PI / 2); 
   
   
   
   
 }
 
 
  
}
