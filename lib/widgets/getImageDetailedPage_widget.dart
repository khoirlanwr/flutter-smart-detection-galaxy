import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_detector/widgets/size_config.dart';

class GetImageDetailedPage extends StatelessWidget {
  final File image;

  GetImageDetailedPage({this.image});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      child: image == null
          ? Container(
              margin: EdgeInsets.only(
                top: SizeConfig.safeBlockVertical * 35,
                left: SizeConfig.safeBlockHorizontal * 10,
                right: SizeConfig.safeBlockHorizontal * 10,
              ),
              width: SizeConfig.safeBlockHorizontal * 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/fxemoji_rocket.png',
                    width: SizeConfig.safeBlockHorizontal * 15,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 3,
                  ),
                  Text(
                    'Pilih foto dari kamera atau gambar dari gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SizeConfig.safeBlockHorizontal * 5.5,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 20),
              width: SizeConfig.safeBlockHorizontal * 100,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 5,
                        left: SizeConfig.safeBlockHorizontal * 20,
                        right: SizeConfig.safeBlockHorizontal * 20,
                      ),
                      child: ClipRRect(
                        child: Image.file(image),
                        borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal * 2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 40,
                        top: SizeConfig.safeBlockVertical * 0),
                    child: Image(
                      image: AssetImage('assets/images/master.png'),
                      width: SizeConfig.safeBlockHorizontal * 20,
                    ),
                  ),
                ],
              )),
    );
  }
}
