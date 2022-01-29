import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlaylistContainer extends StatefulWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  State<PlaylistContainer> createState() => _PlaylistContainerState();
}

class _PlaylistContainerState extends State<PlaylistContainer> {
  @override
  Widget build(BuildContext context) {
    return containerPlaylist();
  }
}

class containers {
  Neumorphic containerPlaylist() {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          border: const NeumorphicBorder(
            color: Colors.white,
            width: 8,
          ),
          depth: -15,
          color: Colors.grey[200]),
      child: Container(
        height: 150,
        width: 150,
        // child: Image.network(
        //     'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg'),
      ),
    );
  }
}
