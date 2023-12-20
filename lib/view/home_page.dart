import 'dart:math';
import 'package:flutter/material.dart';
import 'package:note_app/sample_note_data.dart';
import 'package:note_app/constant/colors.dart';
import 'package:note_app/view/input_page.dart';
import 'package:note_app/model/sample_notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> searchNotes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchNotes = sampleNotes;
  }

  void onChangedSearchText(String searchText) {
    setState(() {
      searchNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Note note = searchNotes[index];
      sampleNotes.remove(note);
      searchNotes.removeAt(index);
    });
  }

  Color getRandomColor() {
    int random = Random().nextInt(6);
    return colors[random];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sort_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
                height: 10,
              ),
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                onChanged: onChangedSearchText,
                decoration: InputDecoration(

                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
                  prefixIcon: const Icon(
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
                  itemCount: searchNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      color: getRandomColor(),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(5),
                          child: RichText(
                            text: TextSpan(
                              text: '${searchNotes[index].title}\n',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: searchNotes[index].content,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        subtitle: const Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'date:2023/12/20',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            deleteNote(index);
                          },
                          icon: const Icon(
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
          onPressed: () async {
            final result = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const InputPage()));
            //第一次給職之後就不能再改變
            if (result != null) {
              setState(() {
                sampleNotes.add(Note(
                  id: sampleNotes.length,
                  title: result[0],
                  content: result[1],
                ));
                searchNotes = sampleNotes;
              });
            }
          },
          elevation: 10,
          shape: const CircleBorder(
            side: BorderSide.none,
            eccentricity: 0,
          ),
          backgroundColor: Colors.grey.shade600,
          child: const Icon(Icons.add),
        ));
  }
}
