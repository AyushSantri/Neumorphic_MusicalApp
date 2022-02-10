import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadYourSong extends StatelessWidget {
  const UploadYourSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Upload Your Song',
          style: GoogleFonts.montserrat(fontSize: 22, color: Colors.black54),
        ),
      ),
      body: const Center(),
    );
  }
}
