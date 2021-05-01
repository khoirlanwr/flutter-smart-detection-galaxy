import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class PlanetRow extends StatelessWidget {
  final String planetName;
  final String planetDesc;
  final String iconPath;

  PlanetRow({this.planetName, this.planetDesc, this.iconPath});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final planetThumbnail = new Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 2,
      ),
      alignment: FractionalOffset.centerLeft,
      child: Image(
        image: AssetImage('$iconPath'),
        width: SizeConfig.safeBlockHorizontal * 22,
      ),
    );

    final planetCard = new Container(
      height: SizeConfig.safeBlockVertical * 14,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: SizeConfig.safeBlockHorizontal * 12,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 2,
          bottom: SizeConfig.safeBlockVertical * 2,
          left: SizeConfig.safeBlockHorizontal * 14,
          right: SizeConfig.safeBlockHorizontal * 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$planetName',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5.8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 0.5,
                bottom: SizeConfig.safeBlockVertical * 1,
              ),
              height: SizeConfig.safeBlockVertical * 0.25,
              color: Colors.blue,
              width: SizeConfig.safeBlockHorizontal * 15,
            ),
            Container(
              width: SizeConfig.safeBlockHorizontal * 80,
              child: Text(
                '$planetDesc',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: new BoxDecoration(
          color: new Color(0xFF333366),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
            SizeConfig.safeBlockHorizontal * 2,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: SizeConfig.safeBlockHorizontal * 8,
              // offset: new Offset(0.0, 10.0),
            )
          ]),
    );

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 1.0,
        horizontal: SizeConfig.safeBlockHorizontal * 4,
      ),
      height: SizeConfig.safeBlockVertical * 14,
      child: Stack(
        children: [
          planetCard,
          planetThumbnail,
        ],
      ),
    );
  }
}
