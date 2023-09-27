import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp/screens/note_details/note_details.dart';
import 'package:noteapp/screens/search_screen/search_screen.dart';
import 'package:noteapp/style/app_style.dart';
import 'package:noteapp/widgets/note_showing_widget.dart';

class CustomBodyView extends StatelessWidget {
  const CustomBodyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: CustomClr.kwhite),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                color: CustomClr.kwhite,
              ),
            )
          ],
          backgroundColor: Colors.white60,
          expandedHeight: 100,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                color: Colors.blueAccent,
              ),
            ),
            title: Text(
              "N o t e A p p",
              style: CustomFuction.texttStyle(
                  weight: FontWeight.w600, color: CustomClr.kwhite, size: 16),
            ),
          ),
        ),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('notes').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (!snapshot.hasData) {
              return SliverFillRemaining(
                child: Center(child: Lottie.asset("assets/empty.json")),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Lottie.asset("assets/empty.json"),
                ),
              );
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Map<String, dynamic> snap = snapshot.data!.docs[index].data();
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: CustomSize.commonRadius,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteDetailsScreen(
                                id: snap['id'],
                                content: snap['content'],
                                date: DateFormat.yMEd()
                                    .format(snap['date'].toDate()),
                                subject: snap['subject'],
                              ),
                            ),
                          );
                        },
                        child: NotesShowingWidget(
                          content: snap['content'],
                          date: DateFormat.yMEd().format(snap['date'].toDate()),
                          updatedDate: snap['editdate'] != null
                              ? DateFormat.yMEd()
                                  .format(snap['editdate'].toDate())
                              : "Not updated",
                          id: snap['id'],
                          subject: snap['subject'],
                        ),
                      ),
                    ),
                  );
                },
                childCount: snapshot.data!.docs.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
