import 'package:flutter/material.dart';
import 'package:flutter_practice/less_group_page.dart';
import 'package:flutter_practice/stateful_group_page.dart';
import 'package:flutter_practice/flutter_layout_page.dart';
import 'package:flutter_practice/builder_context.dart';
import 'package:flutter_practice/gesture_page.dart';
import 'package:flutter_practice/photo_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_practice/animate_page.dart';

void main() => runApp(animatePage());

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('如何创建和使用Flutter的路由与导航'),
//        ),
//        body: RouteNavigator(),
//      ),
//      routes: <String, WidgetBuilder>{    // 注册路由
//        'less' : (BuildContext content) => LessGroupPage(),
//        'ful' : (BuildContext content) => statefulPage(),
//        'layout': (BuildContext content) => FlutterLayoutPage(),
//        'gesture': (BuildContext content) => GesturePage(),
//        'photo': (BuildContext content) => photoPage(),
//      },
//    );
//  }
//}


class MyApp extends StatelessWidget {
  final Tween colorTween = new ColorTween(begin: Colors.transparent, end: Colors.black54);
  @override
  Widget build(BuildContext context) {
    final title = 'Image Demo';
    return MaterialApp(
      title: 'Image Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Icon(Icons.android, size: 100.0,),
        ),
      ),
    );
  }
}

class RouteNavigator extends StatefulWidget {
  RouteNavigator({Key key}) : super(key: key);

  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool _byName = false;      // false代表不使用route跳转，true代表使用route跳转

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(       // Switch切换组件
            title: Text('${_byName ? '' : '不'}通过路由名跳转'),
              value: _byName,
              onChanged: (value) {
                setState(() {
                  _byName = value;
                });
              }
          ),
          _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
          _item('StatefulWidget与基础组件', statefulPage(), 'ful'),
          _item('如何进行Flutter布局的开发', FlutterLayoutPage(), 'layout'),
          _item('检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
          _item('拍照app', photoPage(), 'photo'),
        ],
      ),
    );
  }

  /***
   * 标题
   * 页面实例
   * 路由名称
   */
  Widget _item(title, page, routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (_byName) {
            Navigator.pushNamed(
                context, routeName); // BuildContext的主要作用就是通过上下文获取指定的数据
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (
                context) => page)
            ); // 跳转功能只有Material才有 push方法不需要在MaterialApp中那个进行注册
          }
        },
        child: Text(title),
      ),
    );
  }
}
