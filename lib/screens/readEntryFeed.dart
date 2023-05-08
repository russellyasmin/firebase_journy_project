import 'package:firebase_journy_project/components.dart';
import 'package:firebase_journy_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReadSingleEntry extends StatelessWidget {
  final String title;
  final String date;
  final String entry;
  const ReadSingleEntry({
    super.key,
    required this.title,
    required this.date,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kScreen,
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          JourneyTitle(),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${date.substring(5, 17).trim()}\n${date.substring(0, 5).trim()}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      softWrap: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Divider(
                  color: Colors.white,
                  thickness: 5,
                  endIndent: 20,
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        entry,
                        softWrap: true,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.5),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )),
          SizedBox(
            height: 20,
          ),
          JouneyButton(
              label: "Back",
              func: () {
                Navigator.pop(context);
              }),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    ));
  }
}
