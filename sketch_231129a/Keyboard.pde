String test = "";
int maxCharactersPerLine = 30;
int numOfnl = 0;
int lastSpaceIndex = -1; // Initialize to -1 to indicate no spaces yet
int flashFrameCount = 0;
int flashInterval = 90;

void keyPressed() {


  if (keyCode == LEFT) {
    currentFlashcardI--;
  } else if (keyCode == RIGHT) {
    currentFlashcardI++;
  }


  if (createFlashcard) {
    if (key == ENTER) {


      if (fl.currentSide.equals("Frontside")) {
        fl.setFront(test);

        test = "";

        fl.currentSide = "Backside";

        numOfnl = 0;
        lastSpaceIndex = -1;
      } else if (fl.currentSide.equals("Backside")) {


        fl.setBack(test);

        test = "";
        println("Flashcard saved");
        createFlashcard = false;
        fl.currentSide = "Frontside";

        flashcards.add(fl);
      }


      // Code for when ENTER is pressed
    } else if (key == CODED) {
      if (keyCode == SHIFT) {
        println("You are typing in Shift");
      }
    } else if (key == BACKSPACE) {
      int L = test.length();

      if (fl.currentSide == "Back" && L == 0) {


        test = fl.front;

        fl.currentSide = "Frontside";
      } else if (fl.currentSide == "Front" && L == 0) {


        createFlashcard = false;
      }


      if (L > 0) {
        // Check if the last character is a newline
        if (test.charAt(L - 1) == '\n') {
          numOfnl--;
        }

        // Check if the last character was a space
        if (L - 1 == lastSpaceIndex) {
          lastSpaceIndex = -1; // Reset lastSpaceIndex when deleting the space
        }

        test = test.substring(0, L - 1);
      }
    } else {
      if (numOfnl <= 4) {
        test += key;

        // Check if the current key is a space
        if (key == ' ') {
          lastSpaceIndex = test.length() - 1;
        }

        // Check if the length exceeds the maximum characters per line
        if (test.length() % maxCharactersPerLine == 0) {
          // Check if we are in the middle of a word (lastSpaceIndex != -1)
          if (lastSpaceIndex != -1) {
            // Insert a line break after the last space
            test = test.substring(0, lastSpaceIndex + 1) + '\n' + test.substring(lastSpaceIndex + 1);
            numOfnl++;
            lastSpaceIndex = -1; // Reset lastSpaceIndex after inserting the line break
          }
        }
      }
    }
  }


  if (practiceFlashcards) {
    
    if (key == BACKSPACE) {
      
     practiceFlashcards = false;
      
      
    }
    
    
    
    if (str(key).equals(" ")) {

      println("Space pressed");

      if ( currentFlash.currentSide.equals("Frontside")) {

        currentFlash.currentSide = "Backside";
      } else if ( currentFlash.currentSide.equals("Backside")) {

        currentFlash.currentSide = "Frontside";
      }
    }
  }
}


void keyReleased() {
  // Increment flashFrameCount when a key is released
  flashFrameCount++;
}
