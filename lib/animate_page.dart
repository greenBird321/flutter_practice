import 'package:flutter/material.dart';

class animatePage extends StatefulWidget {
  @override
  _animatePageState createState() => _animatePageState();
}

//TickerProvider vsync是TickerProvider类型，所以必须使用SingleTickerProviderStateMixin
class _animatePageState extends State<animatePage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus animationStatus;
  double animationValue;

  @override
  // animation 所有参数初始化
  void initState() {
    super.initState();
    // 初始化AnimationController 管理动画类
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 400).animate(controller)
      //
      ..addListener(() {      // 只要动画的值发生变化就会调用监听器
        setState(() {
          animationValue = animation.value;
        });
      })      // .. 操作符 提供优雅的链式操作，与animation.addListener(); 一致
      ..addStatusListener((AnimationStatus status) {   // 动画开始，结束，前进或者后退时调用StatusListener; AnimationStatus： dismissed(动画在开始时停止), forward(动画从开始状态执行到结束状态), reverse(动画反向执行，从结束状态执行到开始状态), completed(动画执行完成)
        setState(() {
          animationStatus = status;
        });
      });
  }

  @override
  // 一旦到这个阶段，组件就要被销毁了，这个函数一般会移除监听，清理环境
  void dispose() {
    // 及时的清理资源，释放controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.reset();
              controller.forward();
            },
            child: Text('Start', textDirection: TextDirection.ltr,),
          ),
          Text('Statue: ' + animationStatus.toString(), textDirection: TextDirection.ltr,),
          Text('Value: '+ animationValue.toString(), textDirection: TextDirection.ltr,),
          Container(
            height: animation.value,
            width: animation.value,
            child: FlutterLogo(),
          ),
        ],
      )
    );
  }
}