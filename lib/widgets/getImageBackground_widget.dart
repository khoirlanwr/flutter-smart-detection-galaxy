import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class GetImageBackground extends StatelessWidget {
  final String imagePath;

  GetImageBackground({this.imagePath});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Image.asset(
        '$imagePath',
        fit: BoxFit.cover,
        height: SizeConfig.safeBlockVertical * 36,
        width: double.infinity,
      ),
    );
  }
}
