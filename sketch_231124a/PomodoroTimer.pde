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
   fill(80, 123, 88);
   
  
   arc(width / 2, height / 2, 425, 425, 0, TWO_PI, PIE); 
   
   
   
   
 }
 
 
  
}
