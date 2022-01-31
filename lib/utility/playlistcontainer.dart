import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/utility/neumorphic_playlist_container.dart';

class PlaylistContainer extends StatefulWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  _PlaylistContainerState createState() => _PlaylistContainerState();
}

class _PlaylistContainerState extends State<PlaylistContainer> {
  static List<Widget> playlists = [
    const NeumorphicPlaylist(playlistName: 'Chill'),
    const NeumorphicPlaylist(playlistName: 'Hip-Hop')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: playlists.length,
          itemBuilder: (context, int index) {
            return InkWell(
                onTap: () {
                  print(index);
                },
                child: playlists[index]);
          }),
    );
  }
}
