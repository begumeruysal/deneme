import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// $env:Path += ";C:\Users\begum\AppData\Local\Pub\Cache\bin"
// flutterfire --version

// ...
Future<void> main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: MyApp (),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
TextEditingController _textEditingController = TextEditingController();
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blueGrey,
        title: Text("Firebase"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            FilledButton(onPressed: () {
              final user = <String, dynamic>{
                "Total_Amount": _textEditingController.text,
              };
              _firebaseFirestore.collection("cash").add(user);

            }, child: Text("press"))
          ],
        ),
      ),
    );
  }
}

