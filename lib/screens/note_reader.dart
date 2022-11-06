import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/style/widgets/appStyle.dart';

class NoteReaderScreen extends StatefulWidget {
   NoteReaderScreen(this.doc,{Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id=widget.doc['color_id'];
    return Scaffold(
      backgroundColor: appStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: appStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             widget.doc["note tittle"].toString(),
              style: appStyle.mainTitle,
            ),
            SizedBox(height: 4.0,),
            Text(
              widget.doc["creat database"].toString(),
              style: appStyle.dateTitle,
            ),

            SizedBox(height:30.0,),
            Text(
             widget.doc["note content"].toString(),
              style: appStyle.mainContent,

            )
          ],
        ),
      ),

    );
  }
}
