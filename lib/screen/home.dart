import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BoxDecoration decorationForNeumorphic() {
    return BoxDecoration(
        color: const Color.fromRGBO(204, 208, 215, 1),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -3.0),
              blurRadius: 2.0,
              spreadRadius: 0.0),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(3.0, 3.0),
              blurRadius: 2.0,
              spreadRadius: 0.0)
        ]);
  }

  bool _neumorphic = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(204, 208, 215, 1),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: decorationForNeumorphic(),
                child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Searching not supported yet")));
                      });
                    },
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
