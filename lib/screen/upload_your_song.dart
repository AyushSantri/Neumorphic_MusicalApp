import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class UploadYourSong extends StatefulWidget {
  const UploadYourSong({Key? key}) : super(key: key);

  @override
  State<UploadYourSong> createState() => _UploadYourSongState();
}

class _UploadYourSongState extends State<UploadYourSong> {
  final _formkey = GlobalKey<FormState>();
  var name = ' ';
  File? _file;
  FilePickerResult? result;
  double? _progress;

  addToFireStore() {
    try {
      var storageUploadTask = FirebaseStorage.instance
          .ref("files/${result!.files.single.name}")
          .putFile(_file!);

      storageUploadTask.snapshotEvents.listen((event) {
        setState(() {
          _progress =
              event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
          if (_progress == 1) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('File Uploaded Successfully')));
          }
        });
      });
    } on FirebaseException catch (e) {
      return e.toString();
    }
  }

  submitFile() {
    final validity = _formkey.currentState?.validate();

    if (validity == true) {
      _formkey.currentState!.save();

      addToFireStore();
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
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
                    height: 25,
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
                      : Text(
                          "Select a File",
                          style: GoogleFonts.montserrat(fontSize: 13),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep:
                        _progress != null ? (_progress! * 100).floor() : 0,
                    stepSize: 8,
                    selectedColor: Colors.redAccent,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: 80,
                    height: 80,
                    selectedStepSize: 7,
                    roundedCap: (_, __) => true,
                  ),
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
                        setState(() {
                          submitFile();
                        });
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
      ),
    );
  }
}
