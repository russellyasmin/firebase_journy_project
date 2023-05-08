import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_journy_project/components.dart';
import 'package:firebase_journy_project/constants.dart';
import 'package:firebase_journy_project/screens/addEntryScreen.dart';
import 'package:firebase_journy_project/screens/readListScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JourneyTitle(),
              SizedBox(
                height: h * 0.045,
              ),
              Image.asset(
                'images/journal.png',
                height: h * 0.15,
                width: w * 0.45,
              ),
              SizedBox(
                height: h * 0.08,
              ),
              JouneyButton(
                  label: 'Read Entries',
                  func: () async {
                    await FirebaseFirestore.instance
                        .collection('entrys')
                        .get()
                        .then((snapshot) {
                      List<QueryDocumentSnapshot> docList = snapshot.docs;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadEntry(
                            docs: docList,
                          ),
                        ),
                      );
                    });
                  }),
              SizedBox(
                height: h * 0.02,
              ),
              JouneyButton(
                  label: 'Add Entry',
                  func: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEntryScreen(),
                        ));
                  }),
            ],
          ),
          decoration: kScreen,
          width: w,
          height: h,
        ),
      ),
    );
  }
}
