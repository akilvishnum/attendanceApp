import 'package:attendance/constants.dart';
import 'package:attendance/constraints.dart';
//import 'package:attendance/screens/all_class.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
//import 'package:http_parser/http_parser.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'all_class.dart';

class CaptureImage extends StatefulWidget {
  String classname, useremail;
  List studentsList;
  CaptureImage(this.classname, this.useremail, this.studentsList);
  @override
  _CaptureImageState createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  // Dio dio = new Dio();
  File _image;
  String _uploadedFileURL;
  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => [
          _image = image,
        ]);
  }

  // Future uploadDetails() async {
  //   final response = await http.post("http://192.168.43.11:5000/",
  //       body: json.encode({
  //         'email': '${widget.classname}',
  //         'classname': '${widget.useremail}',
  //         'studentsList': '${widget.studentsList}',
  //         'url': '$_uploadedFileURL',
  //       }));
  //   print(response.body);
  // }

  Future httpdetails() async {
    return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Hey!", style: kHeadingextStyle),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Would you like to process the image?",
                              style: kTitleTextStyle),
                        ],
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 8,
                      bottom: MediaQuery.of(context).size.height / 30,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () async {
                                final response = await http.post(
                                    "http://192.168.43.11:5000/",
                                    body: json.encode({
                                      'email': '${widget.classname}',
                                      'classname': '${widget.useremail}',
                                      'studentsList': '${widget.studentsList}',
                                      'url': '$_uploadedFileURL',
                                    }));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ClassScreen(
                                //             widget.classname,
                                //             widget.studentsList.length
                                //                 .toString(),
                                //             widget.useremail)));
                                Navigator.pop(context);
                                Navigator.pop(context);

                                print(response.body);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: kPrimaryColor,
                                ),
                                child: Text("Upload",
                                    style: kTitleTextStyle.copyWith(
                                        color: Colors.white)),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: kPrimaryLightColor,
                                ),
                                child: Text("Cancel",
                                    style: kTitleTextStyle.copyWith(
                                        color: kPrimaryColor)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) ??
        false;
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: _image == null
                ? Text('Capture Image for Attendance')
                : Image.file(_image)),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.send),
            onPressed: () async {
              StorageReference storageReference = FirebaseStorage.instance
                  .ref()
                  .child('${_image.path.split('/').last}');
              StorageUploadTask uploadTask = storageReference.putFile(_image);
              await uploadTask.onComplete;
              print('File Uploaded');
              storageReference.getDownloadURL().then((fileURL) {
                setState(() {
                  _uploadedFileURL = fileURL;
                });
                print("URL is: $_uploadedFileURL");
              });
              //uploadDetails();
              httpdetails();

              //           final url = 'http://192.168.43.11:5000/';
              //           var request = http.MultipartRequest('POST', Uri.parse(url));
              //           request.files.add(await http.MultipartFile.fromPath(,));
              // var res = await request.send();
              // final url = 'http://192.168.43.11:5000/';
              // String base64image = base64Encode(_image.readAsBytesSync());
              // String fileName = _image.path.split("/").last;
              // http.Response response = await http.post(url, body: {
              //   'image': base64image,
              //   'name': _image.path,
              //   'number': "18"
              // });
              // print("Response is: ${response.body}");
              // String filename = _image.path.split('/').last;
              // print("Base file name : $filename");
              // try {
              //   FormData formData = new FormData.fromMap({
              //     'name': 'Bala',
              //     'age': 20,
              //     'image': _image,
              //   });
              //   Response response = await Dio()
              //       .post("http://192.168.43.11:5000", data: formData);
              //   print("File upload response: ${response.data}");
              //   print(formData.fields);
              // } catch (e) {
              //   print(e.message);
              // }
              // try {
              //   String filename = _image.path.split('/').last;
              //   FormData formData = new FormData.fromMap({
              //     'image': await MultipartFile.fromFile(_image.path,
              //         filename: filename,
              //         contentType: new MediaType('image', 'png')),
              //     'type': 'image/png'
              //   });
              //   Response response = await dio.post("192.168.43.11:5000",
              //       data: formData,
              //       options: Options(headers: {
              //         'accept': "*/*",
              //         'Authorization': "Bearer accresstoken",
              //         'Content-Type': "multipart/form-data"
              //       }));
              //   print("Response is: $response");
              // } catch (e) {
              //   print(e.message);
              // }
            }));
  }
}
