/// 使用AnimatedWidget实现动画, AnimatedWidget是Animated的助手，可以更容易的实现动画
import 'package:flutter/material.dart';

// 使用AnimatedWidget
class AnimatedLogo extends AnimatedWidget {
  // 重写构造方法
  AnimatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric( vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

class animatedWidgetPage extends StatefulWidget {
  @override
  _animatedWidgetPageState createState() => _animatedWidgetPageState();
}

class _animatedWidgetPageState extends State<animatedWidgetPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(seconds: 2), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}