import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController marksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text( "Drift Package Testing"),
        centerTitle: true,
        backgroundColor: Colors.brown.shade50,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField for Student Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), // Space between fields

            // TextField for Student Marks
            TextField(
              controller: marksController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Student Marks',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

     
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String marks = marksController.text;
                
                if (name.isNotEmpty && marks.isNotEmpty) {
                  // Print or use these values (e.g., save to a database)
                  //print('Student Name: $name');
                 // print('Student Marks: $marks');
                } else {
                  //print('Please fill in both fields');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}