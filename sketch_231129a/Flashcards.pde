float startY;

class Flashcard {
  String front;
  String back;
  String currentSide;

  boolean typeIntructions;

  Flashcard() {
    this.front = "";
    this.back = "";
    this.currentSide = "Frontside";
  }


  Flashcard(String f, String b) {

    this.front = f;

    this.back = b;

    this.currentSide = "Frontside";
  }

  void setFront(String f) {
    this.front = f;
  }

  void setBack(String b) {
    this.back = b;
  }

  void drawFlashcard() {
    fill(accent2);


    rectMode(CENTER);

    strokeWeight(20);
    stroke(accent1);
    rect(width / 2, height / 2, width - 100, height - 200, 25);






    textAlign(LEFT);
    textSize(64);

    fill(accent1);
    // Count the number of newlines in the test string
    int numNewlines = 0;
    for (int i = 0; i < test.length(); i++) {
      if (test.charAt(i) == '\n') {
        numNewlines++;
      }
    }


    if (createFlashcard) {

      textSize(20);
      text("Press enter after finishing your flashcard to edit the backside", 950, 620);
    } else if (practiceFlashcards) {

      textSize(20);
      text("Press space to flip a flashcard and use arrow keys to change the flashcards", 850, 620);
      text("Press backspace to stop practicing", 850, 660);
    }


    textSize(64);


    // Adjust the starting position based on the number of newlines
    startY = height / 2 - numNewlines * 30; // Adjust the multiplier as needed

    text(this.currentSide, 100, 200);
    textAlign(CENTER);
    text(test, width / 2, startY);


    if (createFlashcard == false) {

      if (this.currentSide == "Frontside")
        text(front, width/2, height/2);
      else if (this.currentSide == "Backside")
        text(back, width/2, height/2);
    }
  }

  void save() {
    flashcards.add(this);
  }
}
