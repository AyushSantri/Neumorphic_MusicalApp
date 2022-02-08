import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';

class SocialMediaHandle extends StatelessWidget {
  const SocialMediaHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Link(
            uri: Uri.parse('https://www.linkedin.com/in/ayush-santri/'),
            builder: (context, followLink) {
              return IconButton(
                  onPressed: followLink,
                  icon: const Icon(FontAwesomeIcons.linkedin));
            })
      ],
    );
  }
}
