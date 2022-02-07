import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class BottomPLayer extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const BottomPLayer({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width / 1.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.grey[400]!,
            offset: const Offset(4.0, 4.0),
            blurRadius: 2.0,
          )
        ],
        color: Colors.grey[200],
      ),
    );
  }
}
