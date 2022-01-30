import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeumorphicPlaylist extends StatelessWidget {
  final String playlistName;

  const NeumorphicPlaylist({Key? key, required this.playlistName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
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
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          playlistName,
          style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black54),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '10 songs',
          style: GoogleFonts.montserrat(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }
}
