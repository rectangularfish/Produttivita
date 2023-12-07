// import gui library and sound library
import g4p_controls.*;
import ddf.minim.analysis.*;
import ddf.minim.*;

// initializing Minim audio library and AudioPlayer instances
Minim minim;
AudioPlayer fileLofi, fileJazz, filePiano, currentMusic;
FFT fft;

// setting the number of bands for audio analysis and defining an array for smoothed band values
int numBands = 32;
float[] smoothedBandValues = new float[numBands];
float maxCircleSize = 250; // Set the maximum size for the circles




// todolist variables
TodoList list;


// pomodoro timer variables
PomodoroTimer timer;
int breakTime = 5;
int studyTime = 25;
int frameCounter = 0;



// theme variables
color accent1, accent2;
int r1 = 34;
int g1 = 34;
int b1 = 34;

int r2 = 223;
int g2 = 223;
int b2 = 223;




// flashcard variables
ArrayList<Flashcard> flashcards;
Flashcard currentFlash, fl;
boolean typeIntructions;

// music variables
float volume = 100;
String currentMusicString = " ";
int currentFlashcardI, pausedTime = 0;



// boolean variables
boolean lofi, jazz, piano, musicPlaying, createFlashcard, displayFlashcard, timerChanged, practiceFlashcards = false;






void setup() {


  size(1600, 800);
  
  // initilize timer and flashcards variable, flashcard array, and minim audio library
  timer = new PomodoroTimer(studyTime, breakTime, false);
  list = new TodoList();
  flashcards = new ArrayList<Flashcard>();
  minim = new Minim(this);

  // create graphical user inferface
  createGUI();
  
  // load music data
  loadData();
}


void draw() {

  // setting colors for the UI
  accent1 = color(r1, g1, b1);
  accent2 = color(r2, g2, b2);
  background(accent1); 
  fill(accent2); 


  // check if the timer has changed and updating if needed 
  if (timerChanged) {
    timer = new PomodoroTimer(studyTime, breakTime, false);
    timerChanged = false;
  }

  
 
  // draw timer
  timer.drawMe();



  // timer logic
  // if the timer finished start break start study time vice versa
  if (timer.seconds == 0) {

    if (timer.onBreak == true) {

      timer.setState(studyTime, false);
    } else if (timer.onBreak == false) {
      timer.setState(breakTime, true);
    }
    timer.timerStart = true;
  }
  
  // the timer works on framerate
  // every time the sketch runs the fps amount then one second has passed
  if (timer.timerStart == true) {
    frameCounter++;
  }


  // todo list
  list.displayTasks();

  
  
  
  // generate audio visualizer
  genVisualizer();
   
  // flashcard logic
  if (createFlashcard) {
    fl.drawFlashcard();
  }
  
  
  // practicing flashcards logic
  if (practiceFlashcards) {
    // displays current display card
    // change the current flashcard that is being displayed by using arrow keys
    try {
      currentFlash = flashcards.get(currentFlashcardI);
      currentFlash.drawFlashcard();
    }
    // handeles the error when you press an arrow key on the first or last card
    catch (IndexOutOfBoundsException e) {
      println(flashcards.size());
      
      // if there are not existing flashcards
      if (flashcards.size() == 0) {

        practiceFlashcards = false;
      } else {
        // if the user presses the left arrow on the first flashcard go to the last one
        if ( currentFlashcardI < 0) {

          currentFlashcardI = flashcards.size() - 1;
          
        } 
        
        // if the user presses the right arrow on the first flashcard
        else if (currentFlashcardI > flashcards.size() - 1) {

          currentFlashcardI = 0;
        }
      }
    }
  }
}







void loadData() {

  // load music from data folder
  fileLofi = minim.loadFile("lofi.wav", 1024);
  filePiano = minim.loadFile("piano.wav", 1024);
  fileJazz = minim.loadFile("jazz.wav", 1024);
  currentMusic = minim.loadFile("test.wav", 1024);
  
  // initilize mathematical algorithm used for analyzing the frequency
  fft = new FFT(currentMusic.bufferSize(), currentMusic.sampleRate());
}


void playMusic(AudioPlayer i) {
  
  // pause the music 
  currentMusic.pause();
  
  
  
  // set everything to current music that is playing
  currentMusic = i;                           
  currentMusic.play();
  currentMusic.setGain(volume);
  musicPlaying = true;


  fft = new FFT(currentMusic.bufferSize(), currentMusic.sampleRate());

  pauseMusicB.setText("Pause");
}
