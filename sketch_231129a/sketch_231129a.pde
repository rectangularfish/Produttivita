import g4p_controls.*;
import processing.sound.*;


String name = "Nikolaus";


SoundFile fileLofi, fileJazz, fileClassical, currentMusic ;

TodoList list;

PomodoroTimer timer;

int breakTime = 5;

int studyTime = 10;

int drawLoop = 0;

color accent1 = color(34, 34, 34);

color accent2 = color(221, 221, 221);

int frameCounter = 0;
float volume = 100;

boolean lofi = false;
boolean jazz = false;
boolean classical = false;

boolean musicPlaying = false;

boolean createFlashcard = true;



ArrayList<Flashcard> flashcards;



Flashcard fl;
void setup() {
  size(1200, 800);
  frameRate(2000);


  timer = new PomodoroTimer(studyTime, false);

  list = new TodoList();

  list.addTask("Make food");

  fl = new Flashcard();


  createGUI();
  //loadData();
}


void draw() {
  background(accent1); // almost black looks clean

  fill(accent2); // almost white clean

  timer.drawMe();




  if (timer.seconds == 0) {

    if (timer.onBreak == true) {

      timer.setState(studyTime, false);
    } else if (timer.onBreak == false) {
      timer.setState(breakTime, true);
    }


    timer.timerStart = true;
  }
  if (timer.timerStart == true) {
    frameCounter++;
  }


  // todo list
  list.displayTasks();

  // flashcards stuff

  fl.drawFlashcard();

  drawLoop++;
  
}



//void loadData() {

//  fileLofi = new SoundFile(this, "lofi.wav");

//  fileClassical = new SoundFile(this, "piano.wav");

//  //fileJazz = new SoundFile(this, "jazz.wav");
//  currentMusic = new SoundFile(this, "test.wav");



//}


void playMusic(SoundFile i) {

  currentMusic.stop();

  currentMusic = i;

  currentMusic.play();
}
