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
  @override
  Widget build(BuildContext context) {
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
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.play,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
