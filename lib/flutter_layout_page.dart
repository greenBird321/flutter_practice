import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何进行Flutter布局的开发',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行Flutter布局的开发'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),    // 添加返回按钮
        ),
        body: _currentIndex == 0? Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    // 裁剪成圆形
                    child: SizedBox(
                      child: Image.network(
                          'http://b-ssl.duitang.com/uploads/item/201811/06/20181106200902_eirnm.jpg'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      // 裁切方形的圆角
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Opacity(
                        opacity: 0.6, // 设置透明度0.6 60%的透明度
                        child: Image.network(
                          'http://b-ssl.duitang.com/uploads/item/201811/06/20181106200902_eirnm.jpg',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    // 裁切方形的圆角
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Opacity(
                      opacity: 0.6, // 设置透明度0.6 60%的透明度
                      child: Image.network(
                        'http://b-ssl.duitang.com/uploads/item/201811/06/20181106200902_eirnm.jpg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    clipBehavior: Clip.antiAlias,   // 抗锯齿
                    child: PageView(
                      children: <Widget>[
                        _item('Page1', Colors.blue),
                        _item('Page2', Colors.pink),
                        _item('Page3', Colors.red),
                      ],
                    ),
                  )
              ),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey),
                    child: FractionallySizedBox(    // 如果不使用FractionallySizedBox的话，则只会以child里组件的宽度，并不会撑满整个屏幕
                      widthFactor: 1.0,   // 显示系数，可以进行调节
                      child: Text('宽度充满全屏'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Stack(
                      children: <Widget>[
                        Image.network( // 叠加图的 底图
                          'http://b-ssl.duitang.com/uploads/item/201811/06/20181106200902_eirnm.jpg',
                          height: 150,
                          width: 150,
                        ),
                        Positioned( // 定位组件
                          left: 0, // 距离左边0像素
                          bottom: 0, // 距离下面0像素
                          child: Image.network(
                            'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1502920883,387105779&fm=26&gp=0.jpg',
                            height: 36,
                            width: 36,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(       // 水平布局，与ROW不同的是Wrap可以换行
                    spacing: 10, // 水平间距
                    runSpacing: 6, // 垂直间距
                    children: <Widget>[
                      _chip('Flutter'),
                      _chip('进阶'),
                      _chip('实战'),
                      _chip('携程'),
                      _chip('app'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ) : Column(
          children: <Widget>[
            Text('这是一个测试'),
            Expanded( // 在Column的布局影响下，所以是高度填满，宽度不变， 如果是ROW的布局 则会宽度填满， 高度不变
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text('拉伸至全屏'),
                ),
            ),
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.blue,),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.grey,),
              activeIcon: Icon(Icons.list, color: Colors.blue,),
              title: Text('列表'),
            ),
          ],
          onTap: _itemChange,
        ),
      ),
    );
  }

  Widget _item(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(
          title,
          style: TextStyle(fontSize: 22, color: Colors.white)
      ),
    );
  }

  Widget _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(   // 除了进行ClipOval操作可以让图像变圆形 使用CircleAvatar方法也可以
          backgroundColor: Colors.blue.shade900,  // shade 深度
          child: Text(          // 设置头像显示
            label.substring(0, 1),
            style: TextStyle(fontSize: 10,color: Colors.white),
          ),
        ),
    );
  }

  _itemChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
