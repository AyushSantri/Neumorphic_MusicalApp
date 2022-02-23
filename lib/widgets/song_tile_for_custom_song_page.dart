import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongTileForCustomSongPage extends StatefulWidget {
  const SongTileForCustomSongPage(
      {Key? key,
      required this.audioPlayer,
      required this.name,
      required this.url,
      required this.title})
      : super(key: key);

  final AudioPlayer audioPlayer;
  final String name;
  final String url;
  final String title;

  @override
  State<SongTileForCustomSongPage> createState() =>
      _SongTileForCustomSongPageState();
}

class _SongTileForCustomSongPageState extends State<SongTileForCustomSongPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
