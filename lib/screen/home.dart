import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musical_app/widgets/appbarforhome.dart';
import 'package:musical_app/screen/homebody.dart';

import '../entities/songs_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
