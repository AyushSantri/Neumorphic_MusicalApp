import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/entities/songs_data.dart';

class SongTile extends StatefulWidget {
  const SongTile({Key? key, required this.songDetail}) : super(key: key);
  final SongDetail songDetail;

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  late AudioPlayer audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    audioPlayer.setUrl(widget.songDetail.url);
    return ListTile(
      onTap: () {},
      title: Text(
        widget.songDetail.title,
        style: GoogleFonts.montserrat(fontSize: 15, color: Colors.grey[850]),
      ),
      subtitle: Text(
        widget.songDetail.author,
        style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black38),
      ),
      trailing: Container(
        child: IconButton(
          onPressed: () {
            setState(() {
              _isPlaying = !_isPlaying;
              _isPlaying
                  ? audioPlayer.play(widget.songDetail.url)
                  : audioPlayer.pause();
            });
          },
          icon: Icon(
            _isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
