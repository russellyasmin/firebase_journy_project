import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_journy_project/components.dart';
import 'package:firebase_journy_project/screens/addEntryScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../constants.dart';

class ReadEntry extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  const ReadEntry({super.key, required this.docs});

  @override
  State<ReadEntry> createState() => _ReadEntryState();
}

class _ReadEntryState extends State<ReadEntry> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Container(
          decoration: kScreen,
          width: double.infinity,
          height: double.infinity,
          child: widget.docs.isEmpty
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: 20,
                  ),
                  JourneyTitle(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      'Is Add Entry',
                      style: kButtonText,
                    ),
                  )),
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  )
                ])
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    JourneyTitle(),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, Index) {
                              return EntryTile(
                                  title: widget.docs.elementAt(Index)['Title'],
                                  entry: widget.docs.elementAt(Index)['Entry'],
                                  dateTime:
                                      widget.docs.elementAt(Index)['Date']);
                            },
                            separatorBuilder: (context, Index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: widget.docs.length)),
                    SizedBox(
                      height: 20,
                    ),
                    JouneyButton(
                        label: "Back",
                        func: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )),
    ));
  }
}
