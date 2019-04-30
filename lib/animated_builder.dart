/// 使用animatedBuilder进行重写动画, 可以更好的把Animate与业务层分开
import 'package:flutter/material.dart';

// 此LogoWidget 只包含一个图标
class LogoWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

// 使用AnimatedBuilder 必须有一个类 接收child和animation, 动画的逻辑在这里面
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child),
  );
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(child: LogoWidget(),animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
