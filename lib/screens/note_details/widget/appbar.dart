import 'package:flutter/material.dart';
import 'package:noteapp/style/app_style.dart';
import 'package:noteapp/widgets/delete_dialog.dart';

class NoteDetailsAppBar extends StatelessWidget {
  const NoteDetailsAppBar({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: CustomClr.kwhite,
              ),
            ),
            Text(
              "N o t e s",
              style: CustomFuction.texttStyle(
                  weight: FontWeight.w600, color: CustomClr.kwhite, size: 17),
            ),
            IconButton(
              onPressed: () {
                DeleteDialog.cupertinoDelete(context, id);
              },
              icon: Icon(
                Icons.delete_outline_outlined,
                color: CustomClr.kred,
              ),
            )
          ],
        ),
      ),
    );
  }
}
