import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class photoPage extends StatefulWidget {
  photoPage({Key key}) : super(key: key);

  @override
  _photoHomeState createState() => _photoHomeState();
}

class _photoHomeState extends State<photoPage> {
  File _image;

  Future _getImage(bool isTakePhoto) async {
    var image = await ImagePicker.pickImage(source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照app'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo)),
    );
  }

  _pickImage() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
            height: 160,
            child: Column(
              children: <Widget>[
                // 自定义按钮
                _button('拍照', true),
                _button('从相册获取', false),
              ],
            ),
          ),
    );
  }

  // 自定义按钮
  _button(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        title: Text(title),
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        onTap: () => _getImage(isTakePhoto),
      ),
    );
  }
}
