import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.red, fontSize: 30.0);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('I am Text', style: textStyle),
              Icon(Icons.android, color: Colors.green,size: 100,),
              CloseButton(),
              BackButton(),
              // material.io/design/components/chips.html
              Chip(
                avatar: Icon(Icons.payment),
                label: Text('基础组件'),
                deleteIcon: Icon(Icons.close),
                onDeleted: (){
                  //print('33333');
                },
                deleteButtonTooltipMessage: '给点面子',
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              // 分割线
              Divider(
                height: 30, // 容器高度，并不是线的高度
                indent: 10, // 左边间距
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue, // 设置卡片的背景颜色
                elevation: 5, // 卡片的阴影
                margin: EdgeInsets.all(10), //设置卡片的间距
                child: Container(
                  padding: EdgeInsets.all(10),
                child: Text('I am Card', style: textStyle),
              ),
              ),
              AlertDialog(
                title: Text('盘就完事er了'),
                content: Text('你个糟老头子坏的很，信你个👻'),
              ),
              Image(
                  image: new AssetImage('images/1.jpg'),
                  width: 150,
                  height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
