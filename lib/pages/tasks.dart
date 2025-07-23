import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TasksPage extends StatefulWidget {
  TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPage();
}

class _TasksPage extends State<TasksPage> {
  final TextEditingController _searchControllerTasks = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final Tasks = [
    [false, 'Make your first app'],
    [false, 'Update first app'],
    [false, 'Learning firabase'],
    [false, 'Implement new learning'],
  ];

  Padding taskShowcase(bool _value, String _taskTitle, int _index) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 208, 208, 208),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            //CheckBox
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: _value,
                fillColor: WidgetStatePropertyAll(Colors.white),
                shape: CircleBorder(),
                side: BorderSide(
                  color: Color.fromARGB(170, 40, 40, 40),
                ),
                checkColor:const Color.fromARGB(143, 125, 125, 125) ,
                onChanged: (value) => {
                  setState(() {
                    Tasks[_index][0] = !_value;
                    print('value changed');
                  }),
                },
              ),
            )
            ,
            // Task Title
            Text(
              _taskTitle,
              style: TextStyle(
                color: const Color.fromARGB(148, 0, 0, 0),
                fontFamily: 'Roboto',
                fontSize: 20,
              ) ,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --Search Bar Portion
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.only(left: 13),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // search Icon
                    Icon(
                      Icons.search,
                      size: 32,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    // search input
                    Expanded(
                      child: GestureDetector(
                        onTap: () => {_focusNode.unfocus()},
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          focusNode: _focusNode,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            hintText: "Search here",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          cursorColor: Colors.white,
                          controller: _searchControllerTasks,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --Uncompleted Tasks
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "To Be Completed",
                style: TextStyle(
                  fontFamily: "poppins",
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            // Tasks List Here
            ...List.generate(
              Tasks.length,
              (i) => taskShowcase(Tasks[i][0] as bool, Tasks[i][1] as String, i),
            ),
          ],
        ),
      ),
    );
  }
}
