import 'package:flutter/material.dart';
import 'package:flutter_drift/Views/homepage.dart';
import 'data.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Drift database
  final db = AppDatabase();

 
  runApp(MyApp(db: db));
}

class MyApp extends StatelessWidget {
  final AppDatabase db;

  const MyApp({super.key, required this.db});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drift Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(db: db), // Pass database to the HomePage
    );
  }
}
