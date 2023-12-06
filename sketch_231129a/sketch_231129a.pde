import g4p_controls.*;
import processing.sound.*;


String name = "Nikolaus";


SoundFile fileLofi, fileJazz, fileClassical, currentMusic ;

TodoList list;

PomodoroTimer timer;

int breakTime = 5;

int studyTime = 25;

int drawLoop = 0;

color accent1 = color(34, 34, 34);
color accent2 = color(221, 221, 221);



int frameCounter = 0;
float volume = 100;



boolean lofi = false;

boolean jazz = false;

boolean classical = false;

boolean musicPlaying = false;

boolean createFlashcard = false;

boolean displayFlashcard = false;


boolean timerChanged = false;

float pausedTime = 0;


int currentFlashcardI = 0;
ArrayList<Flashcard> flashcards;

boolean practiceFlashcards = false;
Flashcard currentFlash;
Flashcard fl;
void setup() {
  size(1600, 800);


  frameRate(1000);

  timer = new PomodoroTimer(studyTime, breakTime, false);

  list = new TodoList();

  list.addTask("Make food");

  flashcards = new ArrayList<Flashcard>();


  createGUI();
  //loadData();
}


void draw() {
  if (timerChanged) {

    timer = new PomodoroTimer(studyTime, breakTime, false);

    timerChanged = false;
  }


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


  drawLoop++;


  if (createFlashcard) {
    fl.drawFlashcard();

  
  }


  if (practiceFlashcards) {

    try {
      currentFlash = flashcards.get(currentFlashcardI);
      currentFlash.drawFlashcard();
    }

    catch (IndexOutOfBoundsException e) {
      println(flashcards.size());
      if (flashcards.size() == 0) {

        practiceFlashcards = false;
      } else {

        if ( currentFlashcardI < 0) {

          currentFlashcardI = 0;
        } else if (currentFlashcardI > flashcards.size() - 1) {

          currentFlashcardI = flashcards.size() - 1;
        }
      }
    }
  }

}







void loadData() {

  fileLofi = new SoundFile(this, "lofi.wav");

  fileClassical = new SoundFile(this, "piano.wav");

  fileJazz = new SoundFile(this, "jazz.wav");
  currentMusic = new SoundFile(this, "test.wav");
}


void playMusic(SoundFile i) {

  currentMusic.stop();

  currentMusic = i;

  currentMusic.play();
  currentMusic.amp(volume);

  musicPlaying = true;


  pauseMusicB.setText("Pause");
}
