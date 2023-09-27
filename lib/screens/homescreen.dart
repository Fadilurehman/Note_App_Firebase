import 'package:flutter/material.dart';
import 'package:noteapp/screens/add_note/add_note.dart';
import 'package:noteapp/screens/custom_body.dart';

import '../style/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomBodyView(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        label: const Text("Note",
            style: TextStyle(fontSize: 13, color: Colors.white)),
        tooltip: "add new note",
        elevation: 15,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: CustomSize.commonRadius,
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
