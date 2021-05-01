import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class GradientBar extends StatelessWidget {
  final String title;

  GradientBar({this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: SizeConfig.safeBlockVertical * 8,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          const Color(0xFF3366FF),
          const Color(0xFF00CCFF),
        ],
        begin: new FractionalOffset(0.0, 0.0),
        end: new FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      )),
      child: Text(
        '$title',
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.safeBlockHorizontal * 5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
