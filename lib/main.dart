import 'package:flutter/material.dart';
import 'package:musical_app/screen/auth/login.dart';
import 'package:musical_app/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Login(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.grey,
        ));
  }
}
