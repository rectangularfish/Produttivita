class TodoList {

  // arrray to store tasks
  ArrayList<String> tasks;


  // constructor
  TodoList() {

    this.tasks = new ArrayList<String>();
  }


  // add a task to the list
  void addTask(String task) {
    this.tasks.add(task);
  }


  // remove task from the list
  void removeTask(String task) {
    if (this.tasks.contains(task)) {
      this.tasks.remove(task);
    }
  }


  void displayTasks() {

    fill(accent2);
    noStroke();

    // background rectangle and text for the list
    rectMode(CENTER);
    rect(300, height/2, 515, 515, 50);
    fill(accent1);

    textAlign(LEFT);
    textSize(60);

    text("Todo list:", 80, height/2 - 150);
    textSize(48);



    // display tasks
    for (int i = 0; i < tasks.size(); i++) {
      text("-" + " " + this.tasks.get(i), 100, (height/2 - 75) + (i * 50));
    }
  }
}
