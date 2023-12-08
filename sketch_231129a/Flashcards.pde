float startY;

class Flashcard {
  String front; // front side content
  String back; // back side content
  String currentSide; // frontside or backside

  // constructor
  Flashcard() {
    this.front = "";
    this.back = "";
    this.currentSide = "Frontside";
  }

  
  // set content for the front side
  void setFront(String f) {
    this.front = f;
  }
  
  
  // set the content for the back side
  void setBack(String b) {
    this.back = b;
  }
  
  
  // draw flashcard method
  void drawFlashcard() {
   
    
    // create background 
    fill(accent2);
    rectMode(CENTER);
    strokeWeight(20);
    stroke(accent1);
    rect(width / 2, height / 2, width - 100, height - 200, 25);
    textAlign(LEFT);
    textSize(64);
   
    fill(accent1);
    
    
    
    // count the number of newlines in the text_value string
    int numNewlines = 0;
    for (int i = 0; i < text_value.length(); i++) {
      if (text_value.charAt(i) == '\n') {
        numNewlines++;
      }
    }

    // add intructions to the bottom of flashcards to help user understand how to use them
    if (createFlashcard) {

      textSize(20);
      text("Press enter after finishing your flashcard to edit the backside", 950, 620);
    } else if (practiceFlashcards) {

      textSize(20);
      text("Press space to flip a flashcard and use arrow keys to change the flashcards", 850, 620);
      text("Press backspace to stop practicing", 850, 660);
    }


    textSize(64);


    // adjust the starting position based on the number of newlines
    startY = height / 2 - numNewlines * 30; // Adjust the multiplier as needed

    // display current side
    text(this.currentSide, 100, 200);
    textAlign(CENTER);
    text(text_value, width / 2, startY);

    // decide what content to show
    if (createFlashcard == false) {

      if (this.currentSide == "Frontside")
        text(front, width/2, height/2);
      else if (this.currentSide == "Backside")
        text(back, width/2, height/2);
    }
  }
  
  
  // saves object into an array of flashcards
  void save() {
    flashcards.add(this);
  }
}
