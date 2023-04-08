import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesTileWidget extends StatelessWidget {
  final Color colors;
  final String title;
  final void Function(BuildContext)? onDelete;
  final void Function()? onTapNotes;
  const NotesTileWidget({
    super.key,
    required this.colors,
    required this.title,
    required this.onDelete,
    required this.onTapNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              backgroundColor: Colors.red,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              icon: Icons.delete,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: onTapNotes,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
