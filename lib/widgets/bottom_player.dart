import 'package:flutter/material.dart';

class BottomPLayer extends StatelessWidget {
  const BottomPLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.blue,
      ),
    );
  }
}
