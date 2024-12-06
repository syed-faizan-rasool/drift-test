import "package:drift/native.dart";

import 'data.dart';

Future<void> main() async {
 
final db = Database(NativeDatabase.memory());

await db.into(db.student).insert(StudentCompanion.insert(name: "Syed Faizan Rasool" , subject: "Computer"));
await db.into(db.student).insert(StudentCompanion.insert(name: "Zaheer Abbas" , subject: "Computer Science"));
 

(await db.select(db.student).get()).forEach(print);

} 
