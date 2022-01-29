import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/utility/playlistcontainer.dart';

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
        ],
      ),
    );
  }
}
