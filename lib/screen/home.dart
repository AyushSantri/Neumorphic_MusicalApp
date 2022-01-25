import 'package:flutter/material.dart';
import 'package:musical_app/screen/appbarforhome.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BoxDecoration decorationForNeumorphic() {
    return BoxDecoration(
        color: const Color.fromRGBO(227, 225, 225, 0.6),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -3.0),
              blurRadius: 3.0,
              spreadRadius: 0.8),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(3.0, 3.0),
              blurRadius: 3.0,
              spreadRadius: 0.0)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(227, 225, 225, 1),
      body: ,
    );
  }
}
