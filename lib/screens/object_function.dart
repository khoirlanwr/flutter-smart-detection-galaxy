import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_detector/widgets/buttonCamera_widget.dart';
import 'package:smart_detector/widgets/buttonGallery_widget.dart';
import 'package:smart_detector/widgets/getImageBackground_widget.dart';
import 'package:smart_detector/widgets/getImageDetailedPage_widget.dart';
import 'package:smart_detector/widgets/gradient_imgtobackground.dart';
import 'package:smart_detector/widgets/size_config.dart';

import 'package:tflite/tflite.dart';

class ObjectFunction extends StatefulWidget {
  @override
  _ObjectFunctionState createState() => _ObjectFunctionState();
}

class _ObjectFunctionState extends State<ObjectFunction> {
  File _image;
  List _outputs;
  bool _loading = false;
  String _documentId = '';

  final picker = ImagePicker();

  classifyImage(File image) async {
    var outputTemp = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      _loading = false;
      _outputs = outputTemp;

      String result = _outputs[0]['label'];
      // print(result); // 3 Book

      var data = result.split(" ");
      _documentId = data[1];
      // print(_documentId);
    });
  }

  pickImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.camera);
    File img;
    if (pickedImage == null) return null;
    setState(() {
      img = File(pickedImage.path);

      _loading = true;
      _image = img;
    });

    classifyImage(img);
  }

  pickImageFromCamera() async {
    var pickedImage = await picker.getImage(source: ImageSource.camera);
    File img;

    if (pickedImage == null) return null;
    setState(() {
      img = File(pickedImage.path);

      _loading = true;
      _image = img;
    });

    classifyImage(img);
  }

  pickImageFromGallery() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    File img;

    if (pickedImage == null) return null;
    setState(() {
      img = File(pickedImage.path);

      _loading = true;
      _image = img;
    });

    classifyImage(img);
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/customModelFunctions/model_unquant.tflite",
        labels: "assets/customModelFunctions/labels.txt");
  }

  @override
  void initState() {
    super.initState();

    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var _getImage = _image == null
        ? GetImageDetailedPage(image: null)
        : GetImageDetailedPage(image: _image);

    var _getStatus = _outputs != null
        ? Column(
            children: [
              Text(
                "$_documentId",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.safeBlockHorizontal * 5.0,
                ),
              ),
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('object_functions')
                      .doc(_documentId)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('error happen');
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data = snapshot.data.data();
                      return Text(
                        '${data['fungsi']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                        ),
                      );
                    }

                    return Text('loading');
                  })
            ],
          )
        : Container();

    var buttonImgFromGallery = GestureDetector(
      onTap: () {
        pickImageFromGallery();
      },
      child: ButtonGalleryWidget(),
    );

    var buttonImgFromCam = GestureDetector(
      onTap: () {
        pickImageFromCamera();
      },
      child: ButtonCameraWidget(),
    );

    var _getContent = Container(
      child: Column(
        children: [
          _getImage,
          SizedBox(
            height: SizeConfig.safeBlockVertical * 2,
          ),
          _getStatus,
          buttonImgFromCam,
          buttonImgFromGallery,
        ],
      ),
    );

    var _getGradient = GradientImageToBackground();
    var _getImageBackground = GetImageBackground(
      imagePath: 'assets/images/moon-detail.jpg',
    );

    return SafeArea(
      child: Scaffold(
        body: _loading
            ? Container(child: CircularProgressIndicator())
            : Container(
                color: Color(0xFF333366),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [_getImageBackground, _getGradient, _getContent],
                ),
              ),
      ),
    );
  }
}
