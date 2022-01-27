import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

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
  bool isLoginPage = false;

  BoxDecoration Decoration() {
    return BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 5.0,
              spreadRadius: 3.0),
          BoxShadow(
              color: Colors.grey[400]!,
              offset: const Offset(4.0, 4.0),
              blurRadius: 5.0,
              spreadRadius: 3.0)
        ]);
  }

  startAuthentication() {
    final validity = _formkey.currentState?.validate();

    if (validity == true) {
      _formkey.currentState!.save();
      submitForm(_username, _email, _password);
    }
  }

  submitForm(String username, String email, String password) async {
    final auth = FirebaseAuth.instance;
    UserCredential userCredential;

    try {
      if (isLoginPage) {
        userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = userCredential.user!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .set({'username': username, 'email': email});
      }
    } catch (err) {
      Fluttertoast.showToast(msg: err.toString());
    }
  }

  styleForText(double size, String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(fontSize: size, color: Colors.black54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: isLoginPage == false
                ? MediaQuery.of(context).size.height / 1.7
                : MediaQuery.of(context).size.height / 2,
            decoration: Decoration(),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                isLoginPage == true
                    ? styleForText(33, 'Login')
                    : styleForText(33, 'SignUp'),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formkey,
                  child: Column(children: [
/*========================================First Form Field===============================================================*/
                    if (!isLoginPage)
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          key: const ValueKey('username'),
                          style: const TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                              labelText: "username",
                              labelStyle: GoogleFonts.montserrat()),
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return "Incorrect name";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    /*===========================================Second Form Field================================================================*/
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
                      height: 8,
                    ),
                    /*==================================third form field=================================================*/
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
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
                    /*====================================Button to Submit form========================================*/
                    InkWell(
                      onTap: () {
                        setState(() {
                          startAuthentication();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 1.9,
                        height: 53,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0),
                              BoxShadow(
                                  color: Colors.grey[400]!,
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0)
                            ]),
                        child: Center(
                          child: styleForText(
                              22, isLoginPage ? 'Login' : 'SignUp'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    /*==================================*/
                    styleForText(18,
                        isLoginPage ? 'Not a member?' : 'Already a member?'),
                    /*====================Button to check if user want to l0gin or signup==========================*/
                    TextButton(
                      onPressed: () {
                        isLoginPage = !isLoginPage;
                        setState(() {});
                      },
                      child: styleForText(18, isLoginPage ? 'SignUp' : 'Login'),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
