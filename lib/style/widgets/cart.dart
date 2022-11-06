import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/style/widgets/appStyle.dart';


Widget noteCard(Function()? onTop,QueryDocumentSnapshot doc){

  return InkWell(
    onTap: onTop,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: appStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note tittle"].toString(),
            style: appStyle.mainTitle,
          ),
          SizedBox(height: 4.0,),
          Text(
            doc["creat database"].toString(),
            style: appStyle.dateTitle,
          ),

          SizedBox(height: 8.0,),
          Text(
            doc["note content"].toString(),
            style: appStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}