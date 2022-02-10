import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/entities/songs_data.dart';
import 'package:musical_app/screen/music_player.dart';

class SongTile extends StatefulWidget {
  const SongTile({Key? key, required this.songDetail}) : super(key: key);
  final SongDetail songDetail;

  @override
  State<SongTile> createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  late AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    audioCache = AudioCache(prefix: 'asset/audio/', fixedPlayer: audioPlayer);
  }

  playMusic() async {
    await audioCache.play(widget.songDetail.url);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MusicPLayer(
                      audioPlayer: audioPlayer,
                      songDetail: widget.songDetail,
                    )));
      },
      title: Text(
        widget.songDetail.title,
        style: GoogleFonts.montserrat(fontSize: 15, color: Colors.grey[850]),
      ),
      subtitle: Text(
        widget.songDetail.author,
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
