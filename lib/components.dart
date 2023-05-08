import 'package:firebase_journy_project/constants.dart';
import 'package:firebase_journy_project/screens/readEntryFeed.dart';
import 'package:flutter/material.dart';

class JourneyTitle extends StatelessWidget {
  const JourneyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Journey',
          style: TextStyle(
              fontSize: 64,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 10
                ..color = Color(0xff00114f)),
        ),
        Text(
          'Journey',
          style: TextStyle(
              fontSize: 65,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              color: Colors.white),
        )
      ],
    );
  }
}

class JouneyButton extends StatelessWidget {
  final String label;
  final func;
  const JouneyButton({super.key, required this.label, required this.func});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: func,
        child: Container(
          child: Center(
              child: Text(
            label,
            style: kButtonText,
          )),
          width: w * 0.8,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              border: Border.all(width: 3, color: Colors.white)),
        ));
  }
}

class EntryTile extends StatelessWidget {
  final String title;
  final String entry;
  final String dateTime;

  const EntryTile(
      {super.key,
      required this.title,
      required this.entry,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 3,
                offset: Offset(0, 7))
          ]),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReadSingleEntry(
                        date: dateTime,
                        entry: entry,
                        title: title,
                      )));
        },
        contentPadding: EdgeInsets.all(3),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xff00114f),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        subtitle: Text(
          entry,
          style: TextStyle(color: Color(0xff00114f), fontSize: 24),
          overflow: TextOverflow.ellipsis,
        ),
        tileColor: Colors.red,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${dateTime.substring(5, 11)},${dateTime.substring(0, 3)}',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff00114f)),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              '${dateTime.substring(17).trim()}',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff00114f)),
            ),
          ],
        ),
      ),
    );
  }
}
