import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const kScreen = BoxDecoration(
    gradient: LinearGradient(
        colors: [Color(0xffDECBA4), Color(0xff005AA7)],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft));

const kButtonText =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white);

const kTextfield = BoxDecoration(
    color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(10)));
