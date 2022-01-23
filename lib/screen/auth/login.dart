import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  BoxDecoration Decoration() {
    return const BoxDecoration(
        color: Color.fromRGBO(214, 214, 214, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(10.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: 2.0),
          BoxShadow(
              color: Colors.white38,
              offset: Offset(-10.0, -10.0),
              blurRadius: 10.0,
              spreadRadius: 2.0)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(214, 214, 214, 1),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 2,
            decoration: Decoration(),
          ),
        ));
  }
}
