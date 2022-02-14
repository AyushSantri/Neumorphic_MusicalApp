import 'package:flutter/material.dart';
import 'package:musical_app/widgets/add_your_song.dart';

class PlaylistContainer extends StatefulWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  _PlaylistContainerState createState() => _PlaylistContainerState();
}

class _PlaylistContainerState extends State<PlaylistContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: Row(
          children: const [AddYourSong()],
        ));
  }
}
