import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPage();
}

class _NotesPage extends State<NotesPage> {
  FocusNode _focusNode = FocusNode();
  final TextEditingController _searchControllerTasks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Search Bar
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

          // Displaying Notes here
          
    );
  }
}
