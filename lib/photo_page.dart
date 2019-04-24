import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class photoPage extends StatefulWidget {
  photoPage({Key key}) : super(key: key);

  @override
  _photoHomeState createState() => _photoHomeState();
}

class _photoHomeState extends State<photoPage> {
  // 数据源
  List<File> _images = [];

  Future _getImage(bool isTakePhoto) async {
    // 在点击任何一个ListTitle的时候回自动退回 如不加bottomSheet则会一直停留在页面的底端
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(image);
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
        child: Wrap(
          spacing: 5,
          runSpacing: 10,
          children: _images.isEmpty ? [Text('No image selected.')] : _genImages(),
        )
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
    return ListTile(
      title: Text(title),
      leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
      onTap: () => _getImage(isTakePhoto),
    );
  }

  // 自定义图片浏览控件
  _genImages() {
    // 遍历数据源数组并添加删除按钮
     return _images.map((image) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            // 圆角效果的底图
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              image,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ), //fit: 填充方式
          ),
          Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Icon(Icons.close, color: Colors.white, size: 18,),
                    ),
                  ),
                onTap: (){
                  setState(() {
                    _images.remove(image);
                  });
                },
              )
          ),
        ],
      );
    }).toList();
  }
}
