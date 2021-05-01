import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class ButtonGalleryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 1,
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
            'File dari gallery ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: SizeConfig.safeBlockHorizontal * 4.4,
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 2,
          ),
          Icon(Icons.image, color: Colors.white)
        ],
      ),
      decoration: BoxDecoration(
        // color: Colors.lightBlue,
        gradient: LinearGradient(
          colors: [
            Colors.lightBlue[900],
            Colors.lightBlue[600],
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 2),
      ),
    );
  }
}
