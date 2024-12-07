import 'package:flutter/material.dart';
import 'package:flutter_drift/data.dart';
import 'package:drift/drift.dart' hide Column; 

class HomePage extends StatefulWidget {
  final AppDatabase db; // Database instance

  const HomePage({super.key, required this.db});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController marksController = TextEditingController();

  List<Student> students = []; // List to store fetched students

  Student? _editingStudent; // To store the student currently being edited

  @override
  void initState() {
    super.initState();
    fetchStudents(); 
  }

  // Fetch students from the database
  Future<void> fetchStudents() async {
    final fetchedStudents = await widget.db.getAllStudents();
    setState(() {
      students = fetchedStudents;
    });
  }

  // Save student data to the database
  Future<void> saveStudent() async {
  final name = nameController.text;
  final age = int.tryParse(ageController.text);
  final marks = int.tryParse(marksController.text);

  if (name.isNotEmpty && age != null && marks != null) {
    if (_editingStudent != null) {
      // Editing an existing student
      final updatedStudent = StudentsCompanion(
        id: Value(_editingStudent!.id), // ID is required for updates
        name: Value(name),
        age: Value(age),
        marks: Value(marks),
      );

      final success = await widget.db.updateStudent(_editingStudent!.id, updatedStudent);

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student updated successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update student')),
        );
      }
    } else {
      
      final newStudent = StudentsCompanion(
        name: Value(name),
        age: Value(age),
        marks: Value(marks),
      );

      await widget.db.insertStudent(newStudent);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student added successfully!')),
      );
    }

 
    nameController.clear();
    ageController.clear();
    marksController.clear();
    setState(() {
      _editingStudent = null;
    });

    // Refresh the list
    fetchStudents();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter valid data')),
    );
  }
}

 
/*************  ✨ Codeium Command ⭐  *************/
  /// Delete the student with the given [id] from the database and refresh the student list
/******  9c6064d1-de97-4445-9f66-ffdc94fe30fe  *******/
  Future<void> deleteStudent(int id) async {
    await widget.db.deleteStudent(id);
    fetchStudents(); // Refresh the list after deletion
  }

  // Set data in the text fields for editing
  void editStudent(Student student) {
    nameController.text = student.name;
    ageController.text = student.age.toString();
    marksController.text = student.marks.toString();
    setState(() {
      _editingStudent = student;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Fields for Name, Age, Marks
              TextField(
                controller: nameController,
                decoration:  InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: marksController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  labelText: 'Marks',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 16),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: saveStudent,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.brown.shade300),
                  ),
                  child: Text(
                    _editingStudent == null ? 'Save' : 'Update', // Button text changes based on editing
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Display the list of students
              const Text(
                'Saved Students:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

           
              ListView.builder(
                shrinkWrap: true, // Important to make ListView take as much space as required
                physics: NeverScrollableScrollPhysics(), // Disable ListView's internal scrolling
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown.shade300,
                        foregroundColor: Colors.white,
                        child: Text(student.id.toString()),
                      ),
                      title: Text(student.name),
                      subtitle: Text('Age: ${student.age}, Marks: ${student.marks}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit Button
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => editStudent(student),
                          ),
                          // Delete Button
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteStudent(student.id),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
