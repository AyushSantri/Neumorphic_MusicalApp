import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/entities/songs_data.dart';

class SongTile extends StatelessWidget {
  const SongTile({Key? key, required this.songDetail}) : super(key: key);
  final SongDetail songDetail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        songDetail.title,
        style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black54),
      ),
      subtitle: Text(
        songDetail.author,
        style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black54),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.play,
          color: Colors.red,
        ),
      ),
    );
    ;
  }
}
