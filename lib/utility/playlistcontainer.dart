import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PlaylistContainer extends StatelessWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        depth: -6,
        color: Colors.grey[300],
      ),
      child: Container(
        height: 100,
        width: 100,
      ),
    );
  }
}
