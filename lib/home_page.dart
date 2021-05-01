import 'package:flutter/material.dart';
import 'package:smart_detector/screens/object_color.dart';
import 'package:smart_detector/screens/object_function.dart';
import 'package:smart_detector/screens/object_size.dart';
import 'package:smart_detector/widgets/gradient_bar.dart';
import 'package:smart_detector/widgets/planet_row.dart';
import 'package:smart_detector/widgets/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.blue[900],
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientBar(
                  title: 'Smart Detection in Galaxy',
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 3,
                        bottom: SizeConfig.safeBlockVertical * 1.2,
                        left: SizeConfig.safeBlockHorizontal * 3.5),
                    child: Text('Silahkan pilih kekuatanmu ...',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1.5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ObjectColor()));
                  },
                  child: PlanetRow(
                    planetName: 'Mars',
                    planetDesc: 'Lihat warna benda dengan bantuan Mars',
                    iconPath: 'assets/images/mars.png',
                  ),
                ),
                PlanetRow(
                  planetName: 'Neptune',
                  planetDesc: 'Mengenal bentuk benda dengan kacamata Neptune',
                  iconPath: 'assets/images/neptune.png',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObjectFunction()));
                  },
                  child: PlanetRow(
                    planetName: 'Moon',
                    planetDesc:
                        'Ayo cari tahu fungsi benda dengan kekuatan Moon',
                    iconPath: 'assets/images/moon.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ObjectSize()));
                  },
                  child: PlanetRow(
                    planetName: 'Earth',
                    planetDesc:
                        'Gunakan kekuatan Earth untuk cari tahu ukuran benda',
                    iconPath: 'assets/images/earth.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
