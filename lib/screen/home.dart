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

  bool animate = true;
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
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInSine,
                height: 50,
                width: 50,
                decoration: animate
                    ? decorationForNeumorphic()
                    : BoxDecoration(
                        color: const Color.fromRGBO(227, 225, 225, 0.6),
                        borderRadius: BorderRadius.circular(25),
                      ),
                child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        animate = !animate;
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
              Container(
                height: 50,
                width: 50,
                decoration: decorationForNeumorphic(),
                child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        FirebaseAuth.instance.signOut();
                      });
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black54,
                    )),
              ),
            ],
          )),
    );
  }
}
