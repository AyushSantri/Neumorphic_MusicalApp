import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musical_app/widgets/song_tile_for_custom_song_page.dart';

class CustomSongPage extends StatefulWidget {
  const CustomSongPage({Key? key}) : super(key: key);

  @override
  State<CustomSongPage> createState() => _CustomSongPageState();
}

class _CustomSongPageState extends State<CustomSongPage> {
  @override
  void initState() {
    _loadSong();
    super.initState();
  }

  Future<List<Map<String, dynamic>>> _loadSong() async {
    List<Map<String, dynamic>> songFile = [];

    final ListResult result =
        await FirebaseStorage.instance.ref("files").list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      songFile.add({
        "url": fileUrl,
        "uploaded_by": fileMeta.customMetadata?['name'].toString(),
        "title": fileMeta.customMetadata?['title'].toString()
      });
    });
    print(songFile);
    return songFile;
  }

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'User Song',
          style: GoogleFonts.montserrat(fontSize: 25, color: Colors.grey[800]),
        ),
      ),
      body: FutureBuilder(
          future: _loadSong(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return SongTileForCustomSongPage(
                        audioPlayer: audioPlayer,
                        name: snapshot.data![index]['uploaded_by'],
                        url: snapshot.data![index]['url']);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
