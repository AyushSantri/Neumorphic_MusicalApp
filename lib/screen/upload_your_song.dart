import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadYourSong extends StatefulWidget {
  const UploadYourSong({Key? key}) : super(key: key);

  @override
  State<UploadYourSong> createState() => _UploadYourSongState();
}

class _UploadYourSongState extends State<UploadYourSong> {
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
      body: Center(
        child: Form(
            child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextFormField(
                keyboardType: TextInputType.name,
                key: const ValueKey('username'),
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    labelText: "username",
                    labelStyle: GoogleFonts.montserrat()),
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Incorrect name";
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
            ),
          ],
        )),
      ),
    );
  }
}
