import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musical_app/screen/appbarforhome.dart';
import 'package:musical_app/screen/homebody.dart';

import '../entities/songs_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
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
      backgroundColor: Colors.grey[300]!,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: appBarForHome(),
      ),
      body: const HomeBody(),
    );
  }
}
