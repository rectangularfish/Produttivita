
// string to store the text content of a flashcard
String text_value = "";

// these variables allow it so that text content of the flashcard so the text does not go on forever on one line
int maxCharactersPerLine = 30;
int numOfnl = 0;
int lastSpaceIndex = -1;


void keyPressed() {

  // navigate through the flashcards using the left and right arrow keys
  if (keyCode == LEFT) {
    currentFlashcardI--;
  } else if (keyCode == RIGHT) {
    currentFlashcardI++;
  }

  // check if you are creating a new flashcard
  if (createFlashcard) {

    // if the enter key is pressed switch  to the opposite side sides
    if (key == ENTER) {


      if (fl.currentSide.equals("Frontside")) {


        // save the content to the frontside
        fl.setFront(text_value);

        // change sides
        fl.currentSide = "Backside";


        // reset values
        text_value = "";
        numOfnl = 0;
        lastSpaceIndex = -1;
      } else if (fl.currentSide.equals("Backside")) {

        // save the content to the frontside
        fl.setBack(text_value);


        // change sides
        fl.currentSide = "Frontside";

        text_value = "";


        // save the flashcard
        createFlashcard = false;
        flashcards.add(fl);
      }
    }
    // if the user is typing on the keyboard add character to text_value variable
    else if (key == CODED) {
    }
    // if user presses backspace
    if (key == BACKSPACE) {
      int L = text_value.length();


      // when user is creating a flashcard and hits backspace and is on the backside set currentside to front
      if (fl.currentSide == "Back" && L == 0) {


        text_value = fl.front;

        fl.currentSide = "Frontside";

        // when user is creating a flashcard and hits backspace and is on the frontside then stop creating a flashcard
      } else if (fl.currentSide == "Front" && L == 0) {


        createFlashcard = false;
      }

      // remove last character when hitting backspace
      if (L > 0) {
        
        // check if the last character is a newline when deleting character
        if (text_value.charAt(L - 1) == '\n') {
          numOfnl--;
        }

        // Check if the last character was a space
        if (L - 1 == lastSpaceIndex) {
          lastSpaceIndex = -1; // Reset lastSpaceIndex when deleting the space
        }
        
        // remove last character from string
        text_value = text_value.substring(0, L - 1);
      }
    } 
    // handle regular key presses
    else {
      if (numOfnl <= 4) {
        text_value += key;

        // check if the current key is a space
        if (key == ' ') {
          lastSpaceIndex = text_value.length() - 1;
        }

        // check if the length exceeds the maximum characters per line
        if (text_value.length() % maxCharactersPerLine == 0) {
          // check if text_value is in the middle of a word
          if (lastSpaceIndex != -1) {
            // insert a line break after the last space
            text_value = text_value.substring(0, lastSpaceIndex + 1) + '\n' + text_value.substring(lastSpaceIndex + 1);
            numOfnl++;
            // reset lastSpaceIndex after inserting the line break
            lastSpaceIndex = -1; 
          }
        }
      }
    }
  }

  // stop practicing flashcards when BACKSPACE is pressed
  if (practiceFlashcards) {

    if (key == BACKSPACE) {

      practiceFlashcards = false;
    }


    // flip flashcard if spaced is pressed
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
