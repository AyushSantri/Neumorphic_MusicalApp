import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/widgets/playlistcontainer.dart';

import '../entities/songs_data.dart';
import '../widgets/song_tile.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

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
            height: 25,
          ),
          const PlaylistContainer(),
          const Expanded(child: HomeList()),
        ],
      ),
    );
  }
}

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
