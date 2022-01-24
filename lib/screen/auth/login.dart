import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  var _email = ' ';
  var _password = ' ';
  var _username = ' ';
  bool isLoginPage = false;

  BoxDecoration Decoration() {
    return const BoxDecoration(
        color: Color.fromRGBO(238, 238, 238, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(10.0, 10.0),
              blurRadius: 8.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white38,
              offset: Offset(-10.0, -10.0),
              blurRadius: 8.0,
              spreadRadius: 2.0)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 2,
            decoration: Decoration(),
            child: Column(
              children: [
                const Text('Login'),
                Form(
                    child: Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: const ValueKey('email'),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            labelText: "email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.contains('@') == false) {
                              return "Incorrect email";
                            }
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                        ))
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
