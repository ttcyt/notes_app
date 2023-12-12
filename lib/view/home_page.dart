import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/model/sample_notes.dart';
import 'package:note_app/constant/colors.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Color getRandomColor(){
    int random = Random().nextInt(6);
    return colors[random];
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notes',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.grey.shade800,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sampleNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      color: getRandomColor(),
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.all(5),
                          child: RichText(
                            maxLines: 3,
                            text: TextSpan(
                              text: '${sampleNotes[index].title}\n',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              children: [
                                TextSpan(
                                  text: '${sampleNotes[index].content}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'date:${sampleNotes[index].modifiedTime}',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          shape: CircleBorder(
            side: BorderSide.none,
            eccentricity: 0,
          ),
          backgroundColor: Colors.grey.shade600,
          child: Icon(Icons.add),
        ));
  }
}
