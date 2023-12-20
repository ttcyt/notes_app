import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {Navigator.pop(context);},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade800),
                  ),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  TextField(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 35,
                        color: Colors.grey,
                      ),
                    ),


                  ),
                  TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller: _contentController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'type something here',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
            Navigator.pop(context, [_titleController.text,_contentController.text]);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
        ),
        icon: const Icon(
          Icons.save,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
