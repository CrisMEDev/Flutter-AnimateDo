import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1DA1F2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: Icon( Icons.replay ),
        onPressed: (){},
      ),

      body: Center(
        child: ZoomOut(
          animate: false,                   // Para animar la animacion cuando se desee
          from: 30,
          duration: Duration( seconds: 1 ),
          child: FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}