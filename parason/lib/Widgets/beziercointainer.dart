import 'dart:math';

import 'package:flutter/material.dart';

// import 'customclipper.dart';


class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Transform.rotate(
        // angle: -pi / 7.5,
        // child: ClipPath(
          // clipper: ClipPainter(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 252, 252, 251),
                  Color.fromARGB(255, 255, 255, 255),
                ],
              ),
            ),
          ),
        // ),
      // ),
    );
  }
}