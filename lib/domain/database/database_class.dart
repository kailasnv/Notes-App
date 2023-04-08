import 'package:hive_flutter/hive_flutter.dart';

import '../../core/constants.dart';

class MyNotesDatabase {
  //list for Notes
  List myNotesList = [];

  //open the hive database
  final myBox = Hive.box("myBox");

  // if the app opens the first time ever by the user , show some initial data
  void showSomeDefaultNotes() {
    myNotesList = [
      ["Write your Notes", "You can write anything here"],
      ["Slide to delete", "slide right to delete the note"],
    ];
  }

  // Fetch the data from database
  void getDataFromHive() {
    myNotesList = myBox.get(hiveBoxKey);
  }

  // update database
  void updateDatabase() {
    myBox.put(hiveBoxKey, myNotesList);
  }
}
