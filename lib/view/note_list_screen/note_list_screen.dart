// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:note_application_sample/dummy_db.dart';
import 'package:note_application_sample/view/note_list_screen/widgets/note_card.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: DummyDb.notesList.length,
        itemBuilder: (context, index) => NoteCard(
          date: DummyDb.notesList[index]["date"],
          description: DummyDb.notesList[index]["description"],
          title: DummyDb.notesList[index]["title"],
          //fn of delete button
          onDelete: () {
            DummyDb.notesList.removeAt(index);
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
 //to clear data from textfield before opening bottomsheet        
          titleController.clear();
          descriptionController.clear();
          dateController.clear();
          showModalBottomSheet(
            backgroundColor: Colors.blueGrey,
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
//titlefield
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: "Title",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
//descriptionfield
                    TextField(
                      controller: descriptionController,
                      maxLines: 2,
                      decoration: InputDecoration(
                          hintText: "Description",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
//datefield
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                          hintText: "Date",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_month_outlined))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
//save
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              DummyDb.notesList.add({
                                "title": titleController.text,
                                "description": descriptionController.text,
                                "date": dateController.text
                              });
                              Navigator.pop(
                                  context); //to pop bottomsheet on pressing save button
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
//Cancel
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
