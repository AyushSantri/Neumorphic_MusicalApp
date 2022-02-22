import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongTileForUserSong extends StatefulWidget {
  const SongTileForUserSong(
      {Key? key,
      required this.audioPlayer,
      required this.name,
      required this.url})
      : super(key: key);
  final AudioPlayer audioPlayer;
  final String name;
  final String url;

  @override
  State<SongTileForUserSong> createState() => _SongTileForUserSongState();
}

class _SongTileForUserSongState extends State<SongTileForUserSong> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
