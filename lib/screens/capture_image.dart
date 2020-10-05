import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';


class CaptureImage extends StatefulWidget{
  @override 
  _CaptureImageState createState() => _CaptureImageState();
}
class _CaptureImageState extends State<CaptureImage>{
  File _image;
  Future getImage() async{
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() => [
      _image = image,
    ]);
  }
  @override
  void initState(){
      getImage();
      super.initState();
    }
  Widget build (BuildContext context){
    
    return Scaffold(
      body: Center(

        child: _image == null ? Text('Capture Image for Attendance') : Image.file(_image),
      ),
    );
  }
}