import 'package:flutter/material.dart';

class listPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listPage',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('listPage'),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal, // 设置ListView的滚动方向
          children: <Widget>[
            Container(
              height: 500,
              width: 450,
              child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557049051970&di=0df4b78b1a473694c666d60310dfedd8&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fc75c10385343fbf2e8456cd9ba7eca8064388fdb.jpg'),
            ),
            Container(
              height: 500,
              width: 450,
              child:  Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557048822343&di=bf5eac05e0a270812fa7b25231f52a77&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fd1160924ab18972b83474beeedcd7b899e510a90.jpg'),
            ),
            Container(
              height: 500,
              width: 450,
              child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3947621432,3509113494&fm=26&gp=0.jpg'),
            ),
            Container(
              height: 500,
              width: 450,
              child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557054201419&di=9a7b13d0f10774d848473bb6e4dda057&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F377adab44aed2e7344b285578c01a18b87d6fa76.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}