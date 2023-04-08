import 'package:flutter/material.dart';
import 'package:notes/core/const_colors.dart';
import 'package:notes/core/util/custom_butttons.dart';

class ShowFormWidget extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final void Function() onSave;
  const ShowFormWidget({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        // this padding is used  to  move the bottomsheet upwards when the keyboard opens
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            // main sheet

            width: double.infinity,
            height: 280,
            color: kAppbarColor,
            child: Column(
              children: [
                // text inputs for title
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: kShowFormItemsColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        contentPadding: EdgeInsets.only(left: 8),
                      ),
                    ),
                  ),
                ),
                // text inputs Notes description
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: kShowFormItemsColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type Your Notes',
                        contentPadding: EdgeInsets.only(left: 8),
                      ),
                    ),
                  ),
                ),
                /*
                  Buttons For Save and Camcel
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // cancel
                    CustomButton(
                      title: 'Cancel',
                      onTap: () {
                        // clear the texts in controllers
                        titleController.text = '';
                        descriptionController.text = '';
                        Navigator.of(context).pop();
                      },
                    ),
                    // Save
                    CustomButton(
                      title: 'Save',
                      onTap: onSave,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
