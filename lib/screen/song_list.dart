import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musical_app/entities/songs_data.dart';

class SongList extends StatefulWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var data = await rootBundle.loadString('files/songlist.json');
    var decodedJSON = jsonDecode(data);

    var fetchedData = decodedJSON['playlist1'];

    SongData.songData = List.from(fetchedData)
        .map<SongDetail>((item) => SongDetail.fromMap(item))
        .toList();

    print(SongData.songData.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: Container(
        child: Text(SongData.songData[0].title),
      ),
    );
  }
}
