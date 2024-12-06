import "package:drift/drift.dart";


part 'data.g.dart';


class Student extends Table
{

IntColumn get id => integer().autoIncrement()();
TextColumn get name => text()();
TextColumn get subject => text()();

}


class Marks extends Table
{

IntColumn get id => integer().autoIncrement()();
IntColumn get englishmarks => integer()();
IntColumn get urdumarks => integer()();
  
}

abstract class StudentView extends View
{

Student get student;
@override
  Query as()=> select([

student.name

  ]).from(student);
  }


abstract class MarksView extends View
{

Marks get marks;
@override
  Query as()=> select([

marks.englishmarks

  ]).from(marks);
  }


  @DriftDatabase(tables: [
    Student,Marks
  ],
  views:[
    StudentView
  ]
  )



  class Database extends _$Database 
  {

Database(QueryExecutor e): super (e);

int get schemaVersion => 2;

  }







