import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

class PlaylistContainer extends StatefulWidget {
  const PlaylistContainer({Key? key}) : super(key: key);

  @override
  _PlaylistContainerState createState() => _PlaylistContainerState();
}

class _PlaylistContainerState extends State<PlaylistContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, int index) {
            return NeumorphicPlaylist(
              playlistName: 'Chill',
            );
          }),
    );
  }
}

class NeumorphicPlaylist extends StatelessWidget {
  final String playlistName;

  const NeumorphicPlaylist({Key? key, required this.playlistName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          margin: const EdgeInsets.only(top: 17, left: 13, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 5.0,
                  spreadRadius: 3.0),
              BoxShadow(
                  color: Colors.grey[400]!,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 3.0)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(playlistName),
        const SizedBox(
          height: 6,
        ),
        const Text('10 songs'),
      ],
    );
    ;
  }
}

//
// class PlaylistContainer extends StatefulWidget {
//   const PlaylistContainer({Key? key}) : super(key: key);
//
//   @override
//   State<PlaylistContainer> createState() => _PlaylistContainerState();
// }
//
// class _PlaylistContainerState extends State<PlaylistContainer> {
//   containers container = containers();
//
//   static List<Neumorphic> Items = [
//     containers().containerPlaylist(),
//     containers().containerPlaylist(),
//     containers().containerPlaylist(),
//     containers().containerPlaylist()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: Items.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             margin: const EdgeInsets.all(10),
//             child: Items[index],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class containers {
//   Neumorphic containerPlaylist() {
//     return Neumorphic(
//       margin: EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
//       style: NeumorphicStyle(
//         shape: NeumorphicShape.flat,
//         boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
//         // border: const NeumorphicBorder(
//         //   color: Colors.white,
//         //   width: 2,
//         // ),
//         depth: 7,
//       ),
//       child: Container(
//         width: 150,
//         // height: 150,
//         child: Image(
//             height: 300,
//             width: 300,
//             image: NetworkImage(
//                 'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg')),
//       ),
//     );
//   }
// }
