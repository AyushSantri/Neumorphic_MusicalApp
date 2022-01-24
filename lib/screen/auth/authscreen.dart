import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/screen/home.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formkey = GlobalKey<FormState>();
  var _email = ' ';
  var _password = ' ';
  var _username = ' ';
  bool isLoginPage = true;

  BoxDecoration Decoration() {
    return const BoxDecoration(
        color: Color.fromRGBO(238, 238, 238, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.white38,
              offset: Offset(-10.0, 10.0),
              blurRadius: 2.0,
              spreadRadius: -1.0),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(10.0, -10.0),
              blurRadius: 2.0,
              spreadRadius: -1.0)
        ]);
  }

  startAuthentication() {
    final validity = _formkey.currentState!.validate();

    if (validity == true) {
      print('fdisbfi');
      _formkey.currentState!.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }
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
                const SizedBox(
                  height: 15,
                ),
                isLoginPage
                    ? Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                            fontSize: 33, color: Colors.black54),
                      )
                    : Text(
                        'SignUp',
                        style: GoogleFonts.montserrat(
                            fontSize: 33, color: Colors.black54),
                      ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                    child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey('email'),
                        style: const TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                            labelText: "email",
                            labelStyle: GoogleFonts.montserrat()),
                        validator: (value) {
                          if (value?.isEmpty == true ||
                              value?.contains('@') == false) {
                            return "Incorrect email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        key: const ValueKey('password'),
                        style: const TextStyle(color: Colors.grey),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "password",
                          labelStyle: GoogleFonts.montserrat(),
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "generate strong password";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        print("hii");
                        setState(() {
                          startAuthentication();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 1.9,
                        height: 53,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(238, 238, 238, 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white54,
                                  offset: Offset(-2.0, 4.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(4.0, -2.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 2.0)
                            ]),
                        child: Center(
                            child: Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                              color: Colors.black54, fontSize: 22),
                        )),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
