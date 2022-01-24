import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    return const BoxDecoration(
        color: Color.fromRGBO(227, 225, 225, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.white60,
              offset: Offset(-10.0, -10.0),
              blurRadius: 3.0,
              spreadRadius: -1.0),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(10.0, 10.0),
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
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(227, 225, 225, 1),
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
                  key: _formkey,
                  child: Column(children: [
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
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(227, 225, 225, 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white54,
                                  offset: Offset(-2.0, -4.0),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(4.0, 2.0),
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: Center(
                          child: Text(
                            isLoginPage ? 'Login' : 'SignUp',
                            style: GoogleFonts.montserrat(
                                color: Colors.black54, fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      isLoginPage ? 'Not a member?' : 'Already a member?',
                      style: GoogleFonts.montserrat(
                          color: Colors.black54, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        isLoginPage = !isLoginPage;
                        setState(() {});
                      },
                      child: Text(
                        isLoginPage ? 'SignUp' : 'Login',
                        style: GoogleFonts.montserrat(
                            color: Colors.black54, fontSize: 18),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
