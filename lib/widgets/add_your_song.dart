import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/screen/upload_your_song.dart';

class AddYourSong extends StatelessWidget {
  const AddYourSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UploadYourSong()));
          },
          child: Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(top: 17, left: 13, right: 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(30)),
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
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.music_mic,
                color: Colors.grey[700],
                size: 100,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Add Your Song",
          style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black54),
        ),
        const SizedBox(
          height: 6,
        ),
      ],
    );
  }
}
