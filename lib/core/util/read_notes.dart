import 'package:flutter/material.dart';

import 'glass_morphism.dart';

class ReadNotes extends StatelessWidget {
  final String title;
  final String description;
  const ReadNotes({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        /*  Glass Morphism Effect */
        child: SizedBox(
          width: 300,
          height: 700,
          child: GlassMorphism(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 45),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                const Divider(thickness: 2, indent: 10, endIndent: 10),
                // description
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Spacer(),
                // cancel button
                Padding(
                  padding: const EdgeInsets.only(left: 130, bottom: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.cancel, size: 50),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
