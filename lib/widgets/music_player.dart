import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPLayer extends StatelessWidget {
  const MusicPLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text('Listen Now',
                  style: GoogleFonts.montserrat(
                      color: Colors.grey[800],
                      fontSize: 25,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
