import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/entities/songs_data.dart';

class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: SongData.songData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  SongData.songData[index].title,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, color: Colors.black54),
                ),
                subtitle: Text(
                  SongData.songData[index].author,
                  style: GoogleFonts.montserrat(
                      fontSize: 12, color: Colors.black54),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.play,
                    color: Colors.red,
                  ),
                ),
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
}
