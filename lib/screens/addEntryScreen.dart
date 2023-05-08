import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_journy_project/components.dart';
import 'package:firebase_journy_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_journy_project/components.dart';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController entryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              JourneyTitle(),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                    child: TextFormField(
                  controller: titleController,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Entry Title',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 15)),
                )),
                decoration: kTextfield,
                width: w * 0.8,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Center(
                        child: TextFormField(
                      controller: entryController,
                      cursorColor: Colors.white,
                      maxLines: 15,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Create new Entry',
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )),
                    reverse: entryController.text.length > 20 ? true : false,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2.5,
                        color: Colors.white,
                      )),
                  width: w * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              JouneyButton(
                func: () async {
                  if (titleController.text.isEmpty ||
                      entryController.text.isEmpty)
                    showErrorAlert(context);
                  else {
                    await FirebaseFirestore.instance.collection('entrys').add({
                      'Title': titleController.text,
                      'Entry': entryController.text,
                      'Date':
                          DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                    }).then(
                      (value) {
                        (context);
                        Navigator.pop(context);
                      },
                    ).catchError((Error) => showErrorAlert(context));
                    titleController.clear();
                    entryController.clear();
                  }
                },
                label: 'Save',
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  showFireBaseAlert(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Ok'));
    AlertDialog alert = AlertDialog(
      title: Text('Upload Status'),
      content: Text('Entry added successfully'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  showErrorAlert(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Ok'));
    AlertDialog alert = AlertDialog(
      title: Text('Something went wrong'),
      content: Text('Entry not added due to error'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    entryController.dispose();
    super.dispose();
  }
}
