import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class GradientImageToBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: new EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 24,
      ),
      height: SizeConfig.safeBlockVertical * 13,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF333366),
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }
}
