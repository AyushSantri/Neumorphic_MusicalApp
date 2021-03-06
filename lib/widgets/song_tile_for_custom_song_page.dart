import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/screen/music_player_for_custom_songs.dart';

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
  bool _isPlaying = false;

  @override
  void initState() {
    widget.audioPlayer.setUrl(widget.url);
    super.initState();
  }

  playMusic() async {
    await widget.audioPlayer.play(widget.url);
  }

  pauseMusic() async {
    await widget.audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MusicPlayerForCustomSongs(
                    url: widget.url,
                    title: widget.title,
                    author: widget.name,
                    audioPlayer: widget.audioPlayer)));
      },
      title: Text(
        widget.title,
        style: GoogleFonts.montserrat(fontSize: 15, color: Colors.grey[850]),
      ),
      subtitle: Text(
        "by ${widget.name}",
        style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black38),
      ),
      trailing: AnimatedContainer(
        height: 40,
        width: 40,
        padding: const EdgeInsets.only(left: 2.1, bottom: 1.4),
        decoration: _isPlaying
            ? BoxDecoration(
                color: const Color.fromRGBO(227, 225, 225, 0.6),
                borderRadius: BorderRadius.circular(20),
              )
            : BoxDecoration(
                color: const Color.fromRGBO(227, 225, 225, 0.6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -3.0),
                        blurRadius: 3.0,
                        spreadRadius: 0.8),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                        spreadRadius: 0.0)
                  ]),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        child: IconButton(
          onPressed: () {
            setState(() {
              _isPlaying = !_isPlaying;
              _isPlaying ? playMusic() : pauseMusic();
            });
          },
          icon: Icon(
            _isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
            color: Colors.red,
            size: 17,
          ),
        ),
      ),
    );
  }
}
