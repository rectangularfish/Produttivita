import g4p_controls.*;
//import processing.sound.*;
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer fileLofi, fileJazz, filePiano, currentMusic; 
FFT fft;


int numBands = 128;
float[] smoothedBandValues = new float[numBands];
float maxCircleSize = 250; // Set the maximum size for the circles



//SoundFile fileLofi, fileJazz, fileClassical, currentMusic ;



TodoList list;
PomodoroTimer timer;

int breakTime = 5;
int studyTime = 25;
int drawLoop = 0;

color accent1;
color accent2;

int r1 = 34;
int g1 = 34;
int b1 = 34;

int r2 = 223;
int g2 = 223;
int b2 = 223;


int frameCounter = 0;
float volume = 100;


boolean lofi, jazz, piano, musicPlaying, createFlashcard, displayFlashcard, timerChanged, practiceFlashcards = false;

float pausedTime = 0;


int currentFlashcardI = 0;
ArrayList<Flashcard> flashcards;

String currentMusicString = " ";


Flashcard currentFlash, fl;


void setup() {
  size(1600, 800);
  timer = new PomodoroTimer(studyTime, breakTime, false);
  list = new TodoList();
  flashcards = new ArrayList<Flashcard>();
  
  minim = new Minim(this);
  
  
  createGUI();
  loadData();
}


void draw() {

  accent1 = color(r1, g1, b1);

  accent2 = color(r2, g2, b2);



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

      genVisualizer();

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

  
  fileLofi = minim.loadFile("lofi.wav", 1024);
  
  filePiano = minim.loadFile("piano.wav", 1024);
  
  fileJazz = minim.loadFile("jazz.wav", 1024);
  
  currentMusic = minim.loadFile("test.wav", 1024);
  
  fft = new FFT(currentMusic.bufferSize(), currentMusic.sampleRate());
  
  //fileLofi = new SoundFile(this, "lofi.wav");

  //fileClassical = new SoundFile(this, "piano.wav");

  //fileJazz = new SoundFile(this, "jazz.wav");
  //currentMusic = new SoundFile(this, "test.wav");
}


//void playMusic(SoundFile i) {
void playMusic(AudioPlayer i) {
  currentMusic.pause();

  currentMusic = i;

  currentMusic.play();
  currentMusic.setGain(volume);

  musicPlaying = true;
  
  
    fft = new FFT(currentMusic.bufferSize(), currentMusic.sampleRate());


  pauseMusicB.setText("Pause");
}
