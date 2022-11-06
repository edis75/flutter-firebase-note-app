import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/style/widgets/appStyle.dart';


class noteEditorScreen extends StatefulWidget {
  const noteEditorScreen({Key? key}) : super(key: key);

  @override
  State<noteEditorScreen> createState() => _noteEditorScreenState();
}

class _noteEditorScreenState extends State<noteEditorScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id=Random().nextInt(appStyle.cardsColor.length);
    TextEditingController _titleEditingControler=TextEditingController();
    TextEditingController _mainEditingControler=TextEditingController();
    String date=DateTime.now().toString();


    return Scaffold(
      backgroundColor: appStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: appStyle.cardsColor[color_id],
        elevation: 0.0,
        title: Text("Add new note:)",
        style: TextStyle(color: Colors.black),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleEditingControler,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Başlığı giriniz lütfen',
                ),
                style: appStyle.mainTitle,
              ),
              SizedBox(height: 8.0,),
              Text(date,style:appStyle.dateTitle),
              SizedBox(height: 8.0,),
              TextField(
                controller: _mainEditingControler,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Metni giriniz lütfen',
                ),
                style: appStyle.mainContent,
              ),

            ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor: appStyle.acccentColor,
        onPressed: () async{
          FirebaseFirestore.instance.collection("notes").add({
            'color_id': color_id,
            'note tittle':_titleEditingControler.text,
            'note content':_mainEditingControler.text,
            'creat database':date.toString(),
          }).then((value){
            print(value.id);
            Navigator.pop(context);

          }).catchError(
              (error)=>print("kayıt başarı ile gerçekleşemedi ${error} ")
          );
        },
        child: Icon(Icons.save),

      )
    );
  }
}
