import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PlaylistContainer extends StatelessWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          // border: NeumorphicBorder(
          //     isEnabled: true, width: 40, color: Colors.grey[300]),
          depth: 15,
        ),
        child: Container(
          height: 100,
          width: 100,
          child: Image.network(
              'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg'),
        ),
      ),
    );
  }
}
