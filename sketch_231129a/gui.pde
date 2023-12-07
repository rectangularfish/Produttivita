/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:918574:
  appc.background(230);
} //_CODE_:window1:918574:

public void lofiButtonPressed(GButton source, GEvent event) { //_CODE_:lofiMusic:351987:
  playMusic(fileLofi);
} //_CODE_:lofiMusic:351987:

public void pianoButtonPressed(GButton source, GEvent event) { //_CODE_:pianoMusic:529890:

  playMusic(fileClassical);
} //_CODE_:pianoMusic:529890:

public void jazzButtonPressed(GButton source, GEvent event) { //_CODE_:jazzMusic:741816:
  playMusic(fileJazz);
} //_CODE_:jazzMusic:741816:

public void getVolumeSlider(GSlider source, GEvent event) { //_CODE_:volumeSlider:449108:
  volume = volumeSlider.getValueF() / 100;
  currentMusic.amp(volume);
} //_CODE_:volumeSlider:449108:

public void playMusicButtonPressed(GButton source, GEvent event) { //_CODE_:pauseMusicB:501192:
  if (musicPlaying) {
    // Pause the music and store the current position
    currentMusic.pause();
    pausedTime = currentMusic.position();
    pauseMusicB.setText("Resume");
    musicPlaying = false;
  } else {
    // Resume the music from the stored position
    currentMusic.cue(pausedTime);
    currentMusic.play();
    pauseMusicB.setText("Pause");
    musicPlaying = true;
  }
} //_CODE_:pauseMusicB:501192:

public void setStudyTimer(GTextField source, GEvent event) { //_CODE_:studyAmount:773092:

  timer.timerStart = false;

  startTimer.setText("Start Timer");


  String studyAmountText = source.getText();
  if (!studyAmountText.isEmpty()) {
    int studyAmountValue = int(studyAmountText);
    studyTime = studyAmountValue;
    if (studyTime == 0 || studyTime > 999) {
      studyTime = 25;
    }
    println("Study time set to: " + studyTime);
  }
  timerChanged = true;
} //_CODE_:studyAmount:773092:

public void setBreakTimer(GTextField source, GEvent event) { //_CODE_:breakAmount:879775:
  timer.timerStart = false;
  startTimer.setText("Start Timer");

  String breakAmountText = source.getText();
  if (!breakAmountText.isEmpty()) {
    int breakAmountValue = int(breakAmountText);
    breakTime = breakAmountValue;
    if (breakTime == 0 || breakTime > 999) {
      breakTime = 5;
    }
    println("Break time set to: " + breakTime);
  }
  timerChanged = true;
} //_CODE_:breakAmount:879775:

public void timerPressed(GButton source, GEvent event) { //_CODE_:startTimer:907608:
  if (timer.timerStart == false) {
    startTimer.setText("Pause");
    timer.timerStart = true;
  } else if (timer.timerStart == true) {

    startTimer.setText("Resume");

    timer.timerStart = false;
  }
} //_CODE_:startTimer:907608:

public void addtoToDoList(GTextField source, GEvent event) { //_CODE_:itemAdd:302669:
  if (event == GEvent.ENTERED) {
    // Get the text from the todoField
    String todoText = source.getText();

    // Check if the text is not empty
    if (!todoText.isEmpty()) {

      list.addTask(todoText);

      source.setText("");

      println("Task added to the Todo list: " + todoText);
    }
  }
} //_CODE_:itemAdd:302669:

public void removetoToDoList(GTextField source, GEvent event) { //_CODE_:removeField:287909:
  println("removeField - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:removeField:287909:

public void genFlashcardPressed(GButton source, GEvent event) { //_CODE_:genFlashcard:367377:
  fl = new Flashcard();

  createFlashcard = true;
} //_CODE_:genFlashcard:367377:

public void practice(GButton source, GEvent event) { //_CODE_:practiceFlashcard:245375:

  if (practiceFlashcards == false && flashcards.size() > 0) {


    practiceFlashcard.setText("Practice Flashcards");

    practiceFlashcards = true;
  } else if (practiceFlashcards == true && flashcards.size() > 0) {


    practiceFlashcard.setText("Stop Practicing");

    practiceFlashcards = false;
  }
} //_CODE_:practiceFlashcard:245375:

public void redSlider1(GSlider source, GEvent event) { //_CODE_:redSliderAccent1:591484:
  println("redSliderAccent1 - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:redSliderAccent1:591484:

public void greenSlider_1(GSlider source, GEvent event) { //_CODE_:greenSliderAccent_1:535167:

  g1 = greenSliderAccent_1.getValueI();
} //_CODE_:greenSliderAccent_1:535167:

public void blueSlider_1(GSlider source, GEvent event) { //_CODE_:blueSliderAccent_1:872495:

  b1 = blueSliderAccent_1.getValueI();
} //_CODE_:blueSliderAccent_1:872495:

public void resetButtonPressedAccent1(GButton source, GEvent event) { //_CODE_:reset1:909434:


  redSliderAccent_1.setValue(34);
  blueSliderAccent_1.setValue(34);
  greenSliderAccent_1.setValue(34);
} //_CODE_:reset1:909434:

public void removeToDoList(GTextField source, GEvent event) { //_CODE_:removeItem:883900:
  println("removeItem - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:removeItem:883900:

public void removeToDoListItem(GTextField source, GEvent event) { //_CODE_:itemRemove:820157:
  if (event == GEvent.ENTERED) {
    // Get the text from the removeField
    String taskToRemove = source.getText();

    // Check if the text is not empty
    if (!taskToRemove.isEmpty()) {
      // Remove the task from the todo list
      list.tasks.remove(taskToRemove);


      source.setText("");


      // Print a message to the console (you can remove this line if not needed)
      println("Task removed from the Todo list: " + taskToRemove);
    } else {
      // Print a message to the console if the text field is empty (you can remove this line if not needed)
      println("Text field is empty. Please enter a task to remove.");
    }
  }
} //_CODE_:itemRemove:820157:

public void redSlider_1(GSlider source, GEvent event) { //_CODE_:redSliderAccent_1:668846:

  r1 = redSliderAccent_1.getValueI();
} //_CODE_:redSliderAccent_1:668846:

public void redSlider_2(GSlider source, GEvent event) { //_CODE_:redSliderAccent_2:666156:
  r2 = redSliderAccent_2.getValueI();
} //_CODE_:redSliderAccent_2:666156:

public void greenSlider_2(GSlider source, GEvent event) { //_CODE_:greenSliderAccent_2:855862:
  g2 = greenSliderAccent_2.getValueI();
} //_CODE_:greenSliderAccent_2:855862:

public void blueSlider_2(GSlider source, GEvent event) { //_CODE_:blueSliderAccent_2:401191:
  b2 = blueSliderAccent_2.getValueI();
} //_CODE_:blueSliderAccent_2:401191:

public void resetButtonPressedAccent2(GButton source, GEvent event) { //_CODE_:reset2:665703:
  redSliderAccent_2.setValue(233);
  blueSliderAccent_2.setValue(233);
  greenSliderAccent_2.setValue(233);
} //_CODE_:reset2:665703:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 590, 600, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  lofiMusic = new GButton(window1, 151, 76, 118, 30);
  lofiMusic.setText("Play Lofi Music");
  lofiMusic.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  lofiMusic.addEventHandler(this, "lofiButtonPressed");
  pianoMusic = new GButton(window1, 11, 75, 117, 30);
  pianoMusic.setText("Play Piano Music");
  pianoMusic.addEventHandler(this, "pianoButtonPressed");
  jazzMusic = new GButton(window1, 13, 161, 117, 30);
  jazzMusic.setText("Play Jazz Music");
  jazzMusic.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  jazzMusic.addEventHandler(this, "jazzButtonPressed");
  volumeSlider = new GSlider(window1, 83, 119, 112, 40, 10.0);
  volumeSlider.setShowValue(true);
  volumeSlider.setLimits(50, 0, 100);
  volumeSlider.setNumberFormat(G4P.INTEGER, 0);
  volumeSlider.setOpaque(false);
  volumeSlider.addEventHandler(this, "getVolumeSlider");
  pauseMusicB = new GButton(window1, 157, 160, 115, 30);
  pauseMusicB.setText("No Music Playing");
  pauseMusicB.addEventHandler(this, "playMusicButtonPressed");
  musicLabel = new GLabel(window1, 89, 36, 85, 36);
  musicLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  musicLabel.setText("Music");
  musicLabel.setOpaque(false);
  label1 = new GLabel(window1, 376, 35, 126, 37);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Pomodoro Timer");
  label1.setOpaque(false);
  studyAmount = new GTextField(window1, 448, 77, 49, 30, G4P.SCROLLBARS_NONE);
  studyAmount.setText("25");
  studyAmount.setPromptText("25");
  studyAmount.setOpaque(true);
  studyAmount.addEventHandler(this, "setStudyTimer");
  studyLabel = new GLabel(window1, 353, 82, 80, 20);
  studyLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  studyLabel.setText("Study Time:");
  studyLabel.setOpaque(false);
  breakLabel = new GLabel(window1, 353, 125, 80, 20);
  breakLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  breakLabel.setText("Break Time:");
  breakLabel.setOpaque(false);
  breakAmount = new GTextField(window1, 449, 121, 50, 30, G4P.SCROLLBARS_NONE);
  breakAmount.setText("5");
  breakAmount.setPromptText("5");
  breakAmount.setOpaque(true);
  breakAmount.addEventHandler(this, "setBreakTimer");
  startTimer = new GButton(window1, 396, 164, 80, 30);
  startTimer.setText("Start Timer");
  startTimer.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  startTimer.addEventHandler(this, "timerPressed");
  todoLabel = new GLabel(window1, 83, 217, 105, 42);
  todoLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  todoLabel.setText("Todo List");
  todoLabel.setOpaque(false);
  addLabel = new GLabel(window1, 70, 269, 99, 32);
  addLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  addLabel.setText("Add:");
  addLabel.setOpaque(false);
  itemAdd = new GTextField(window1, 141, 270, 120, 30, G4P.SCROLLBARS_NONE);
  itemAdd.setPromptText("Add Something");
  itemAdd.setOpaque(true);
  itemAdd.addEventHandler(this, "addtoToDoList");
  removeLabel = new GLabel(window1, 57, 317, 101, 31);
  removeLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  removeLabel.setText("Remove:");
  removeLabel.setOpaque(false);
  removeField = new GTextField(window1, -378, -35, 120, 30, G4P.SCROLLBARS_NONE);
  removeField.setPromptText("Remove Something");
  removeField.setOpaque(true);
  removeField.addEventHandler(this, "removetoToDoList");
  label2 = new GLabel(window1, 379, 225, 100, 38);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Flashcards");
  label2.setOpaque(false);
  genFlashcard = new GButton(window1, 373, 274, 116, 30);
  genFlashcard.setText("Create a flashcard");
  genFlashcard.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  genFlashcard.addEventHandler(this, "genFlashcardPressed");
  practiceFlashcard = new GButton(window1, 368, 319, 129, 30);
  practiceFlashcard.setText("Practice Flashcards");
  practiceFlashcard.addEventHandler(this, "practice");
  redSliderAccent1 = new GSlider(window1, -1335, 168, 100, 40, 10.0);
  redSliderAccent1.setShowValue(true);
  redSliderAccent1.setLimits(34, 0, 255);
  redSliderAccent1.setNumberFormat(G4P.INTEGER, 0);
  redSliderAccent1.setOpaque(false);
  redSliderAccent1.addEventHandler(this, "redSlider1");
  greenSliderAccent_1 = new GSlider(window1, 118, 441, 100, 40, 10.0);
  greenSliderAccent_1.setShowValue(true);
  greenSliderAccent_1.setLimits(34, 0, 255);
  greenSliderAccent_1.setNumberFormat(G4P.INTEGER, 0);
  greenSliderAccent_1.setOpaque(false);
  greenSliderAccent_1.addEventHandler(this, "greenSlider_1");
  blueSliderAccent_1 = new GSlider(window1, 118, 474, 100, 40, 10.0);
  blueSliderAccent_1.setShowValue(true);
  blueSliderAccent_1.setLimits(34, 0, 255);
  blueSliderAccent_1.setNumberFormat(G4P.INTEGER, 0);
  blueSliderAccent_1.setOpaque(false);
  blueSliderAccent_1.addEventHandler(this, "blueSlider_1");
  reset1 = new GButton(window1, 93, 524, 80, 30);
  reset1.setText("Reset");
  reset1.addEventHandler(this, "resetButtonPressedAccent1");
  accent1Label = new GLabel(window1, 79, 369, 98, 31);
  accent1Label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  accent1Label.setText("Colour 1:");
  accent1Label.setOpaque(false);
  label3 = new GLabel(window1, 46, 407, 101, 35);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Red:");
  label3.setOpaque(false);
  label4 = new GLabel(window1, 43, 443, 105, 30);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Green:");
  label4.setOpaque(false);
  label5 = new GLabel(window1, 45, 477, 105, 30);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("Blue:");
  label5.setOpaque(false);
  label6 = new GLabel(window1, -1100, 135, 92, 31);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("My label");
  label6.setOpaque(false);
  removeItem = new GTextField(window1, -172, -193, 120, 32, G4P.SCROLLBARS_NONE);
  removeItem.setOpaque(true);
  removeItem.addEventHandler(this, "removeToDoList");
  itemRemove = new GTextField(window1, 140, 318, 120, 30, G4P.SCROLLBARS_NONE);
  itemRemove.setPromptText("Remove Something");
  itemRemove.setOpaque(true);
  itemRemove.addEventHandler(this, "removeToDoListItem");
  label7 = new GLabel(window1, 372, 370, 109, 33);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Colour 2:");
  label7.setOpaque(false);
  label8 = new GLabel(window1, 339, 412, 105, 36);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("Red:");
  label8.setOpaque(false);
  label9 = new GLabel(window1, 337, 449, 109, 34);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("Green:");
  label9.setOpaque(false);
  label10 = new GLabel(window1, 339, 484, 105, 37);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("Blue:");
  label10.setOpaque(false);
  redSliderAccent_1 = new GSlider(window1, 119, 409, 100, 40, 10.0);
  redSliderAccent_1.setShowValue(true);
  redSliderAccent_1.setLimits(34, 0, 255);
  redSliderAccent_1.setNumberFormat(G4P.INTEGER, 0);
  redSliderAccent_1.setOpaque(false);
  redSliderAccent_1.addEventHandler(this, "redSlider_1");
  redSliderAccent_2 = new GSlider(window1, 415, 411, 100, 40, 10.0);
  redSliderAccent_2.setShowValue(true);
  redSliderAccent_2.setLimits(233, 0, 255);
  redSliderAccent_2.setNumberFormat(G4P.INTEGER, 0);
  redSliderAccent_2.setOpaque(false);
  redSliderAccent_2.addEventHandler(this, "redSlider_2");
  greenSliderAccent_2 = new GSlider(window1, 413, 447, 100, 40, 10.0);
  greenSliderAccent_2.setShowValue(true);
  greenSliderAccent_2.setLimits(233, 0, 255);
  greenSliderAccent_2.setNumberFormat(G4P.INTEGER, 0);
  greenSliderAccent_2.setOpaque(false);
  greenSliderAccent_2.addEventHandler(this, "greenSlider_2");
  blueSliderAccent_2 = new GSlider(window1, 413, 483, 100, 40, 10.0);
  blueSliderAccent_2.setShowValue(true);
  blueSliderAccent_2.setLimits(233, 0, 255);
  blueSliderAccent_2.setNumberFormat(G4P.INTEGER, 0);
  blueSliderAccent_2.setOpaque(false);
  blueSliderAccent_2.addEventHandler(this, "blueSlider_2");
  reset2 = new GButton(window1, 386, 528, 80, 30);
  reset2.setText("Reset");
  reset2.addEventHandler(this, "resetButtonPressedAccent2");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton lofiMusic; 
GButton pianoMusic; 
GButton jazzMusic; 
GSlider volumeSlider; 
GButton pauseMusicB; 
GLabel musicLabel; 
GLabel label1; 
GTextField studyAmount; 
GLabel studyLabel; 
GLabel breakLabel; 
GTextField breakAmount; 
GButton startTimer; 
GLabel todoLabel; 
GLabel addLabel; 
GTextField itemAdd; 
GLabel removeLabel; 
GTextField removeField; 
GLabel label2; 
GButton genFlashcard; 
GButton practiceFlashcard; 
GSlider redSliderAccent1; 
GSlider greenSliderAccent_1; 
GSlider blueSliderAccent_1; 
GButton reset1; 
GLabel accent1Label; 
GLabel label3; 
GLabel label4; 
GLabel label5; 
GLabel label6; 
GTextField removeItem; 
GTextField itemRemove; 
GLabel label7; 
GLabel label8; 
GLabel label9; 
GLabel label10; 
GSlider redSliderAccent_1; 
GSlider redSliderAccent_2; 
GSlider greenSliderAccent_2; 
GSlider blueSliderAccent_2; 
GButton reset2; 
