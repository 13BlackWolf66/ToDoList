import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.controller,
      required this.onCanceled,
      required this.onAdd});
  
  final controller;
  VoidCallback onAdd;
  VoidCallback onCanceled;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[100],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              autofocus: true,
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: onAdd,
                  color: Colors.amber[400],
                  child: Text(
                    'Add',
                    style: GoogleFonts.rubik(fontSize: 17),
                  ),
                ),
                MaterialButton(
                  onPressed: onCanceled,
                  color: Colors.amber[400],
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.rubik(fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
