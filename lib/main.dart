import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/screen/auth/authscreen.dart';
import 'package:musical_app/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyABVXiVKOpBOrQwDQzQvPrX3dGntM3JU1M',
          appId: '1:446214435201:android:e86f82c186a8cbcdc4f880',
          messagingSenderId: '446214435201',
          projectId: 'music-app-ca11a'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const AuthScreen();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.grey,
        ));
  }
}
