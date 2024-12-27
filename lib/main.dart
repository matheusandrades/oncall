import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const OnCallApp());
}

class OnCallApp extends StatelessWidget {
  const OnCallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnCall Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
} 