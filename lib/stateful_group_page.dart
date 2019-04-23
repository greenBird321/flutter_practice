import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class statefulPage extends StatefulWidget {
  statefulPage({Key key}) : super(key: key);

  @override
  _statefulPageState createState() => _statefulPageState();
}

class _statefulPageState extends State<statefulPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Image(
                            image: new AssetImage('images/1.jpg'),
                          ),
                          Chip(
                            label: Text('这是一张图片'),
                            avatar: Icon(Icons.add_alarm),
                            deleteButtonTooltipMessage: '稍微给点面子',
                            deleteIcon: Icon(Icons.close),
                            onDeleted: () {},
                          ),
                          TextField(
                            // 输入文本的样式 装饰器
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                              alignLabelWithHint: true,
                              hintText: '这是一个测试',
                              prefixIcon: Icon(Icons.watch),
                            ),
                            //textAlign: TextAlign.center,
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(color: Colors.white),
                            child: PageView(
                              children: <Widget>[
                                _item('Page1', Colors.deepPurple),
                                _item('Page2', Colors.red),
                                _item('Page3', Colors.orange),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onRefresh: _handleRefresh)
            : Text('列表页'),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              // 默认情况下的图片以及图标颜色
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              // 选中状态下的图片以及图片颜色
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              // 默认情况下的图片以及图标颜色
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              // 选中状态下的图片以及图片颜色
              title: Text('列表'),
            )
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('Click'),
        ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000)); // milliseconds 这是毫秒
    return null;
  }

  Widget _item(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
