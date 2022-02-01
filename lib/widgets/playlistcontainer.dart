import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/screen/song_list.dart';
import 'package:musical_app/widgets/neumorphic_playlist_container.dart';

class PlaylistContainer extends StatefulWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  _PlaylistContainerState createState() => _PlaylistContainerState();
}

class _PlaylistContainerState extends State<PlaylistContainer> {
  List<Widget> playlists = [
    const AddYourSong(),
    const NeumorphicPlaylistContainer(playlistName: 'Hip-Hop')
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: playlists.length,
          itemBuilder: (context, int index) {
            return playlists[index];
          }),
    );
  }
}
