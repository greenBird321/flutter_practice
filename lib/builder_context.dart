import 'package:flutter/material.dart';

class builderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: contextPage(),
    );
  }
}

class contextPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterDemo'),
      ),
      body: Builder(
          builder: (BuildContext context) {
            return FlatButton(
                onPressed: (){      // 点击回调函数 返回的是null Container设置无效 直接使用 .of 可以使用链条操作
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('hello')));
                  /*
                  Container(
                    child: Column(
                      children: <Widget>[
                        Image.network('http://b-ssl.duitang.com/uploads/item/201811/06/20181106200902_eirnm.jpg', width: 200, height: 200,),
                      ],
                    ),
                  );
                  */
                },
                child: Text('BUTTON'),
            );
          }
      ),
    );
  }
}