import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20),
          child: const Row(children: [
            Text(
              "Create A New Task",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80),
            ),
            CircleAvatar(
              child: Image(image: AssetImage('assets/images/Work.png')),
            ),
          ]),
        ),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("Title"),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            width: 380,
            height: 100,
            child: TextField(
              controller: titlecontroller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("Description"),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 200,
            width: 380,
            child: TextField(
              controller: descriptioncontroller,
              minLines: 10,
              maxLines: 10,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),
        SizedBox(
          height: 300,
        ),
        Center(
            child: MaterialButton(
          height: 60,
          minWidth: 300,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.yellow,
          onPressed: () {
            var newTask = {
              "title": titlecontroller.text,
              "description": descriptioncontroller.text,
            };
            Navigator.pop(context, newTask); // Pass data back
          },
          child: Text("Save Task"),
        )),
      ]),
    );
  }
}
