import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation; // 控制动画执行速度

// PhotoHero 是动画依附控件，使用前后都会使用到
class PhotoHero extends StatelessWidget {
  PhotoHero({Key key, this.photo, this.onTap, this.width}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo, // hero的tag使用的是photo的值，所以动画的tag要与结束动画的tag一致
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.fill,
              ),
            ),
          )), // tag参数是唯一的不可重复，代表此动画的id，Hero动画其实是已经跳转到了一个新的界面

//      child: InkWell(
//        onTap: onTap,
//        child: Image.network(photo, fit: BoxFit.fill,),
//      )
    );
  }
}

// hero动画
class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 设置动画执行速度
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Hero Animation'),
        ),
        body: Center(
          child: PhotoHero(
            photo:
                'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=782235402,3778810321&fm=26&gp=0.jpg',
            width: 300.0,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('动画后跳转页'),
                  ),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                    child: PhotoHero(
                      // 动画进行中的tag，要与结束后的widget的tag一致
                      photo:
                      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=782235402,3778810321&fm=26&gp=0.jpg',
                      width: 100,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
              }));
            },
          ),
        ));
  }
}
