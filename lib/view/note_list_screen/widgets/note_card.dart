// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      this.onDelete,
      this.onEdit,
      this.onShare});

  final String title;
  final String description;
  final String date;

  final void Function()? onDelete;
  final void Function()? onShare;
  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: Color(0xFF607D8B)
          color: Colors.blueGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Spacer(),
//delete
              IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
//edit
              IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ))
            ],
          ),
          Text(
            description,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Row(
            children: [
              Text(
                date,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              Spacer(),
//share
              IconButton(
                  onPressed: onShare,
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
