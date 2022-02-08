import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/entities/songs_data.dart';

class MusicPLayer extends StatefulWidget {
  final SongDetail songDetail;
  final AudioPlayer audioPlayer;
  const MusicPLayer(
      {Key? key, required this.songDetail, required this.audioPlayer})
      : super(key: key);

  @override
  State<MusicPLayer> createState() => _MusicPLayerState();
}

class _MusicPLayerState extends State<MusicPLayer> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  PlayerState _playerState = PlayerState.PLAYING;
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();

    audioCache =
        AudioCache(prefix: 'asset/audio/', fixedPlayer: widget.audioPlayer);

    widget.audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    widget.audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });

      widget.audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
        setState(() {
          _playerState = state;
        });
      });
    });

    playMusic();
  }

  @override
  void dispose() {
    super.dispose();

    widget.audioPlayer.release();
    audioCache.clearAll();
  }

  playMusic() async {
    await audioCache.play(widget.songDetail.url);
  }

  pauseMusic() async {
    await widget.audioPlayer.pause();
  }

  stopMusic() async {
    await widget.audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text('Listen Now',
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[800],
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 65,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.height / 4.5,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5.0,
                          spreadRadius: 3.0),
                      BoxShadow(
                          color: Colors.grey[400]!,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 3.0)
                    ],
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/1431129444362579971/jGrgSKDD_400x400.jpg'))),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Text(
              widget.songDetail.title,
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  color: Colors.black87,
                  letterSpacing: widget.songDetail.title.length >= 25 ? -2 : 0),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.songDetail.author,
              style: GoogleFonts.montserrat(
                  fontSize: 20, color: Colors.black54, letterSpacing: 0.7),
            ),
            const SizedBox(
              height: 20,
            ),
            SliderTheme(
              data: const SliderThemeData(
                  trackHeight: 2,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Slider(
                  value: _position.inSeconds.toDouble(),
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
                  activeColor: Colors.red[600],
                  onChanged: (double value) {
                    widget.audioPlayer.seek(Duration(seconds: value.toInt()));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.only(left: 2.1, bottom: 1.4),
                  decoration: _playerState == PlayerState.PAUSED
                      ? BoxDecoration(
                          color: const Color.fromRGBO(227, 225, 225, 0.6),
                          borderRadius: BorderRadius.circular(20),
                        )
                      : BoxDecoration(
                          color: const Color.fromRGBO(227, 225, 225, 0.6),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -3.0),
                                  blurRadius: 4.0,
                                  spreadRadius: -2),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 3.0,
                                  spreadRadius: 0.0)
                            ]),
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _playerState == PlayerState.PLAYING
                            ? pauseMusic()
                            : playMusic();
                      });
                    },
                    icon: Icon(
                      _playerState == PlayerState.PAUSED
                          ? CupertinoIcons.play_fill
                          : CupertinoIcons.pause_fill,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
