import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/Widgets/constants.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData icon;
  final String metin;

  IconCinsiyet({
    this.icon = FontAwesomeIcons.user,
    this.metin = "İnsan",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          metin,
          style: kMetinStili,
        ),
      ],
    );
  }
}
