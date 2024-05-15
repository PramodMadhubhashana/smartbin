import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smartbin/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Firebase.apps.isEmpty) {
    print("Firebase is initialized :: ${Firebase.app().options}");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Smart Dust Bin",
      home: Home(),
    );
  }
}
