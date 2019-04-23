import 'package:flutter/material.dart';


class GesturePage extends StatefulWidget {

  @override
  _GestureHomeState createState() => _GestureHomeState();
}

class _GestureHomeState extends State<GesturePage> {
  String _outPut = '';
  double moveX = 0, moveY = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Gesture'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _printMsg('点击'),
                  onDoubleTap: () => _printMsg('双击'),
                  onLongPress: () => _printMsg('长按'),
                  onTapCancel: () => _printMsg('取消'),
                  onTapUp: (TapUpDetails e) => _printMsg('松开'),
                  onTapDown: (TapDownDetails e) => _printMsg('摁下'),
                  child: Container(
                    padding: EdgeInsets.all(60),
                    decoration: BoxDecoration(color: Colors.blue),
                    child: Text('ClickMe', style: TextStyle(color: Colors.white, fontSize: 36),),
                  ),
                ),
                Text(_outPut),
              ],
            ),
            Positioned(
                top: moveY,
                left: moveX,
                child: GestureDetector(             // child 代表设置会覆盖的区域
                  onPanUpdate: (e) => _doMove(e),   // 当手指移动时，会触发此方法
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(36)),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      _outPut += ' ${msg}';
    });
  }

  _doMove(DragUpdateDetails e) {
      setState(() {
        moveX += e.delta.dx;
        moveY += e.delta.dy;
      });
      print(e);
  }
}