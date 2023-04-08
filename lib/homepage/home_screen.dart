import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/homepage/widgets/read_notes.dart';
import 'package:notes/domain/database/database_class.dart';
import 'package:notes/homepage/widgets/notes_tile.dart';
import 'package:notes/homepage/widgets/show_form.dart';

import '../core/const_colors.dart';
import '../core/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /* 
    text controllers
  */
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  //
  // a instance of database class
  MyNotesDatabase db = MyNotesDatabase();

  /*
   if the app opens for the first time ever show some default data , otherwise load from database
  */
  final _myBox = Hive.box('myBox');
  @override
  void initState() {
    if (_myBox.get(hiveBoxKey) == null) {
      db.showSomeDefaultNotes();
    } else {
      db.getDataFromHive();
    }

    super.initState();
  }

/* save note to database */
  void saveNotesMethod() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      setState(() {
        db.myNotesList.add([titleController.text, descriptionController.text]);
      });
      db.updateDatabase();
      Navigator.of(context).pop();
      titleController.text = "";
      descriptionController.text = "";
    } else {
      // show snack bar !
    }
  }

  /* delete notes method */
  void deleteNotesMethod(int index) {
    setState(() {
      db.myNotesList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // appbar
      appBar: AppBar(
        backgroundColor: kAppbarColor,
        title: const Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // list of notes
      body: ListView.builder(
        itemCount: db.myNotesList.length,
        itemBuilder: (context, index) {
          // final colors = Colors.accents[index % db.myNotesList.length + 3];
          final colors = Colors.accents[index % 6 + 4];
          return NotesTileWidget(
            colors: colors,
            title: db.myNotesList[index][0],
            onDelete: (value) {
              deleteNotesMethod(index);
            },
            onTapNotes: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ReadNotes(
                    title: db.myNotesList[index][0],
                    description: db.myNotesList[index][1],
                  );
                },
              );
            },
          );
        },
      ),
      // add new notes button
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAddButtonColor,
        onPressed: () {
          showFormMethod(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // bottom sheet for - add notes
  void showFormMethod(BuildContext context) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (context) {
          return ShowFormWidget(
            titleController: titleController,
            descriptionController: descriptionController,
            onSave: () => saveNotesMethod(),
          );
        });
  }
}
