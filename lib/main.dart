import 'package:flutter/material.dart';
import 'package:flutter_application_test/screen/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: SignIn(),
    );
  }
}
