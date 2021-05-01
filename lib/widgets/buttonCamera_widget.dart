import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class ButtonCameraWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 4,
        left: SizeConfig.safeBlockHorizontal * 13,
        right: SizeConfig.safeBlockHorizontal * 13,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Foto dari camera',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.safeBlockHorizontal * 4.4,
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 2,
          ),
          Icon(Icons.camera, color: Colors.white)
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue[800],
            Colors.blue[400],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
      ),
    );
  }
}
