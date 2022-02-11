import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadYourSong extends StatefulWidget {
  const UploadYourSong({Key? key}) : super(key: key);

  @override
  State<UploadYourSong> createState() => _UploadYourSongState();
}

class _UploadYourSongState extends State<UploadYourSong> {
  final _formkey = GlobalKey<FormState>();
  var name = ' ';
  var instaUrl = ' ';
  File? _file;
  FilePickerResult? result;

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
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
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
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    key: const ValueKey('InstaID URL'),
                    style: const TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        labelText: "InstaID URL",
                        labelStyle: GoogleFonts.montserrat()),
                    validator: (value) {
                      if (value?.isEmpty == true ||
                          !Uri.parse(value!).isAbsolute) {
                        return "Incorrect URL";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      instaUrl = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                      result = await FilePicker.platform
                          .pickFiles(type: FileType.audio);

                      if (result == null) return;

                      setState(() {
                        var path = result!.files.single.path;
                        _file = File(path!);
                      });
                    },
                    child: Text(
                      'Add Song',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                result != null
                    ? Text(
                        result!.files.single.name,
                        style: GoogleFonts.montserrat(fontSize: 13),
                      )
                    : Text("Select a File",
                        style: GoogleFonts.montserrat(fontSize: 13)),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'Submit Song',
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
