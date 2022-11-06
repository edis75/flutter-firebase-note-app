import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/screens/note_reader.dart';
import 'package:flutter_note_app/style/widgets/appStyle.dart';
import 'package:flutter_note_app/style/widgets/cart.dart';
import 'package:google_fonts/google_fonts.dart';

import 'note_editor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Note App"),
        centerTitle: true,
        backgroundColor: appStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "your recent notes",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot  <QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                    ),
                      children: snapshot.data!.docs.map((note) => noteCard(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>NoteReaderScreen(note)));
                      },note)).toList(),

                    );
                  }
                  return Text(
                    "there is no notes here",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>noteEditorScreen()));
      },
          label: Text("add Note"),
      icon: Icon(Icons.add ),),
    );
  }
}
