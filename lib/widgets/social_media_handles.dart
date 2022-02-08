import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class SocialMediaHandle extends StatelessWidget {
  const SocialMediaHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Link(
            uri: Uri.parse('https://www.linkedin.com/in/ayush-santri/'),
            builder: (context, followLink) {
              return IconButton(
                  iconSize: 25,
                  onPressed: followLink,
                  icon: Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.blue[700],
                  ));
            }),
        Link(
            uri: Uri.parse('https://github.com/AyushSantri'),
            builder: (context, followLink) {
              return IconButton(
                  iconSize: 25,
                  onPressed: followLink,
                  icon: const Icon(
                    FontAwesomeIcons.githubSquare,
                    color: Colors.black,
                  ));
            })
      ],
    );
  }
}
