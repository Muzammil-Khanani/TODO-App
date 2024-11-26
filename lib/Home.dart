import 'package:flutter/material.dart';
import 'package:todoapp/Task.dart';

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  List<Map<String, String>> tasks = [];
  _navigateToTaskScreen() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Task()),
    );
    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    "Welcome To The Notes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                  ),
                  CircleAvatar(
                    child: Image(
                      image: AssetImage('assets/images/Work.png'),
                      fit: BoxFit.cover,
                    ),
                    radius: 25,
                  ),
                ],
              ),
            ),
            const Text(
              "Have A Great Day",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "My Priority Task",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 150,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(left: 90, top: 5),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone_android_rounded,
                            color: Color.fromARGB(255, 197, 197, 197),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: const Text("2 Hours Ago",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 197, 197, 197))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(right: 20, left: 5),
                        child: const Text("Mobile App  UI Design",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 252, 251, 251))),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: const Text("Using Figma And Other Tools",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 197, 197, 197))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 150,
                  width: 120,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(left: 90, top: 5),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: Color.fromARGB(255, 197, 197, 197),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: const Text("4 Hours Ago",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 197, 197, 197))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: const Text("Capture Sun Rise Shots",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 252, 251, 251))),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Text("Complete GuruShot Challenge",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 197, 197, 197))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "My Tasks",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: IconButton.filled(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        _navigateToTaskScreen();
                      },
                      icon: Icon(
                        Icons.add,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const DefaultTabController(
              length: 3,
              child: TabBar(
                  tabAlignment: TabAlignment.center,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: ("Today's Task"),
                    ),
                    Tab(
                      text: ("Weekly Task"),
                    ),
                    Tab(
                      text: ("Monthly Task"),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tileColor: Colors.white,
                        leading: Icon(Icons.calendar_month_outlined),
                        title: Text(task['title'] ?? 'No title'),
                        subtitle: Text(task['description'] ?? 'description'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.more_vert_sharp),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
