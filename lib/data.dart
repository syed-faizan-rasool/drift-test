import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

part 'data.g.dart';

// Students Table Definition
@DataClassName("Student")
class Students extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
  IntColumn get marks => integer()();
}

@DriftDatabase(tables: [Students])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  
  Future<List<Student>> getAllStudents() => select(students).get();


  Future<int> insertStudent(StudentsCompanion student) => into(students).insert(student);


Future<bool> updateStudent(int id, StudentsCompanion student) async {
  // Check if the student exists first by ID
  final existingStudent = await (select(students)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  if (existingStudent != null) {
    // If the student exists, update them with the new values
    try {
      final result = await update(students).replace(student);
      
      // If update is successful, return true
      if (result != 0) {
        print('Student updated successfully');
        return true;
      } else {
        print('Update failed, no rows affected.');
        return false;
      }
    } catch (e) {
      print("Error updating student: $e");
      return false;
    }
  } else {
    print("Student with id $id not found.");
    return false;
  }
}




  Future<int> deleteStudent(int id) {
    return (delete(students)..where((tbl) => tbl.id.equals(id))).go();
  }
}

// Open the connection to the database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app_database.sqlite');
    return NativeDatabase(file);
  });
}
