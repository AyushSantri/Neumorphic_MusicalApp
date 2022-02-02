import 'package:flutter/material.dart';
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
          if (SongData.songData.isEmpty)
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else
            homeList(),
        ],
      ),
    );
  }
}
