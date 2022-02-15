import 'package:flutter/material.dart';

class CustomSongPage extends StatelessWidget {
  const CustomSongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text('User Song'),
      ),
    );
  }
}
