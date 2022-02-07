import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPLayer extends StatelessWidget {
  const BottomPLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
