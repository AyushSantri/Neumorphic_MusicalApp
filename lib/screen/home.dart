import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BoxDecoration decorationForNeumorphic() {
    return const BoxDecoration(
        color: Color.fromRGBO(227, 225, 225, 1),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.white60,
              offset: Offset(-10.0, -10.0),
              blurRadius: 4.0,
              spreadRadius: -2.0),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(10.0, 10.0),
              blurRadius: 5.0,
              spreadRadius: 0.0)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(227, 225, 225, 1),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(227, 225, 225, 1),
                ),
                child: IconButton(
                    splashRadius: 30,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    )),
              ),
              const Text("Home"),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: const Text('LogOut')),
            ],
          )),
    );
  }
}
