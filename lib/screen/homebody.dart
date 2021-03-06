import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/widgets/playlistcontainer.dart';

import '../entities/songs_data.dart';
import '../widgets/song_tile.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var data = await rootBundle.loadString('files/songlist.json');
    var decodedJSON = jsonDecode(data);

    var fetchedData = decodedJSON['playlist1'];

    SongData.songData = List.from(fetchedData)
        .map<SongDetail>((item) => SongDetail.fromMap(item))
        .toList();

    setState(() {});
  }

  late AudioPlayer audioPlayer = AudioPlayer();

  Expanded homeList() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: SongData.songData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SongTile(
                songDetail: SongData.songData[index],
                audioPlayer: audioPlayer,
              ),
              const Divider(
                color: Colors.black54,
                indent: 20,
                endIndent: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Collections',
                style:
                    GoogleFonts.montserrat(fontSize: 15, color: Colors.black54),
              ),
              const Text(
                '...',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const PlaylistContainer(),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
                style:
                    GoogleFonts.montserrat(fontSize: 15, color: Colors.black54),
              ),
              const Text(
                '...',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SongData.songData.isEmpty
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              : homeList(),
        ],
      ),
    );
  }
}
