import 'dart:io';

void main() {
  List<String> toDoTasks = [
    "Attend Town hall meeting",
    "Submit weekly assessment",
    "Attend Thanksgiving Service",
  ];

  List<bool> taskStatus = [false, true, false];

  bool running = true;

  while (running) {
    print("\n My to-do list Menu");
    print("1. Add a Task");
    print("2. View all Tasks");
    print("3. Mark Task as Done");
    print("4. Delete Task");
    print("5. Exit menu");
    print("Enter either 1-5 to select to access menu");

    // Read user input
    String? menuOption = stdin.readLineSync();

    switch (menuOption) {
      case '1':
        print("Enter your new to-do task:");
        String? newTask = stdin.readLineSync();

        if (newTask != null && newTask.isNotEmpty) {
          toDoTasks.add(newTask);
          taskStatus.add(false);
          print("SUCCESSFUL!: New task added: '$newTask'.");
        } else {
          print("Error Occurred!: Your to-do task cannot be empty.");
        }
        break;

      case '2':
        print("\nCurrent To-Do List:");

        if (toDoTasks.isEmpty) {
          print("Your To-Do List is empty! Add a task using option 1.");
        } else {
          for (int i = 0; i < toDoTasks.length; i++) {
            bool isCompleted = taskStatus[i];
            String description = toDoTasks[i];

            // Determine the display string based on the status
            String statusCheck = isCompleted ? "[X] DONE" : "[ ] Pending";

            // Print Task Number (i+1) for user interaction
            print("${i + 1}. $statusCheck - $description");
          }
        }
        break;

      case '3':
        if (toDoTasks.isEmpty) {
          print("Your To-Do List is empty. There's no task to mark as done.");
          break;
        }

        print("\nEnter the number of the task to mark Complete:");
        String? input = stdin.readLineSync()?.trim();
        int? taskInput = int.tryParse(input ?? '');

        print("\nTasks to Mark as Done ");
        for (int i = 0; i < toDoTasks.length; i++) {
          String checkStatus = taskInput[i] ? "[X] DONE" : "[ ] Pending";
          print("${i + 1}. $checkStatus - ${toDoTasks[i]}");
        }

        int index = taskStatus! - 1;

        if (index >= 0 && index < toDoTasks.length) {
          String taskToMark = toDoTasks[index];
          taskStatus[index] = true; //
          print("SUCCESSFUL! Task '$taskToMark' has been marked as DONE!");
        } else {
          print("ERROR: Invalid task number.");
        }
        break;

      case '4':
        if (toDoTasks.isEmpty) {
          print("List is empty. You have no task to delete.");
          break;
        }

        print("\nTasks to Delete: ");
        for (int i = 0; i < toDoTasks.length; i++) {
          print("${i + 1}. $toDoTasks[i]}");
        }

        print("\nEnter the NUMBER of the task to DELETE:");
        String? input = stdin.readLineSync();
        int? taskNumber = int.tryParse(input ?? '');

        if (taskNumber == null) {
          print("ERROR: Invalid input. Please enter a number.");
          break;
        }

        int taskList = taskNumber - 1;

        if (taskList >= 0 && taskList < toDoTasks.length) {
          String deletedTask = toDoTasks[taskList];

          print("SUCCESS: Task deleted: '$deletedTask'.");
        } else {
          print("ERROR: Invalid task number.");
        }
        break;

      case '5':
        running = false;
        print("Exiting your To-Do List. Goodbye!");
        break;

      default:
        print("This is an invalid number, number must be between 1 - 5");
    }
  }
}
