import 'package:flutter/material.dart';
import 'package:app1/pages/notes.dart';
import 'package:app1/pages/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final _appBarTitle = ['Notes...', 'Tasks...'];
  void _customizeHomeView(String value) {
    setState(() {});
  }
  List<Widget> get _actionButtonOpt => [
    PopupMenuButton<String>(
      icon: Icon(
        Icons.list_sharp,
        color: const Color.fromARGB(255, 0, 0, 0),
        size: 36,
      ),
      onSelected: (value) => _customizeHomeView(value),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: 'ListView',
          child: Row(
            children: [
              Icon(
                Icons.list,
                size: 32,
                color: const Color.fromARGB(160, 0, 0, 0),
              ),
              SizedBox(width: 24),
              Text(
                'List View',
                style: TextStyle(
                  color: const Color.fromARGB(160, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'GridView',
          child: Row(
            children: [
              Icon(
                Icons.grid_3x3,
                size: 32,
                color: const Color.fromARGB(160, 0, 0, 0),
              ),
              SizedBox(width: 24),
              Text(
                'Grid View',
                style: TextStyle(
                  color: const Color.fromARGB(160, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'LandScape',
          child: Row(
            children: [
              Icon(
                Icons.landscape,
                size: 32,
                color: const Color.fromARGB(160, 0, 0, 0),
              ),
              SizedBox(width: 24),
              Text(
                'Landscape view',
                style: TextStyle(
                  color: const Color.fromARGB(160, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    )
    ,
    PopupMenuButton<String>(
      icon: Icon(
        Icons.sort,
        color: const Color.fromARGB(255, 0, 0, 0),
        size: 36,
      ),
      onSelected: (value) => _customizeHomeView(value),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem(
          value: 'Latest',
          child: Row(
            children: [
              Icon(
                Icons.list,
                size: 32,
                color: const Color.fromARGB(160, 0, 0, 0),
              ),
              SizedBox(width: 24),
              Text(
                'Sort by the Latest',
                style: TextStyle(
                  color: const Color.fromARGB(160, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'Alerttime',
          child: Row(
            children: [
              Icon(
                Icons.grid_3x3,
                size: 32,
                color: const Color.fromARGB(160, 0, 0, 0),
              ),
              SizedBox(width: 24),
              Text(
                'Sort by Alert Time',
                style: TextStyle(
                  color: const Color.fromARGB(160, 0, 0, 0),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    )
    ,

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(72, 158, 158, 158),
        title: Container(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            _appBarTitle[_currentIndex],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 10),
            child: Row(
              children: [
                _actionButtonOpt[_currentIndex],
                IconButton(
                  onPressed: () => {Navigator.pushNamed(context, '/settings')},
                  icon: Icon(
                    Icons.settings,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [NotesPage(), TasksPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 205, 205, 205),

        selectedFontSize: 16,
        unselectedFontSize: 16,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notes_sharp, color: Colors.black, size: 32),
            label: "Notes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_sharp, color: Colors.black, size: 32),
            label: "Tasks",
          ),
        ],
      ),
    );
  }
}
