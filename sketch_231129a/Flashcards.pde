class Flashcard {
  String front;
  String back;
  String currentSide;

  Flashcard() {
    this.front = "";
    this.back = "";
    this.currentSide = "Front";
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
    noStroke();
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

    // Adjust the starting position based on the number of newlines
    float startY = height / 2 - numNewlines * 30; // Adjust the multiplier as needed

    text(currentSide, 100, 200);
    textAlign(CENTER);
    text(test, width / 2, startY);
  }

  void save() {
    flashcards.add(this);
  }
  
  
  
}
