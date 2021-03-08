import 'package:flutter/material.dart';

class pageRouteScaleUp extends PageRouteBuilder {
  final Widget widget;

  pageRouteScaleUp({this.widget}):super(

    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secAnimation) {
      return widget;
    },
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (BuildContext context, Animation <double> animation,
        Animation <double> secAnimation, Widget child)
    {
      animation = CurvedAnimation(
        parent: animation, curve: Curves.fastOutSlowIn,
      );
      return ScaleTransition(
        scale: animation.drive(Tween<double>(begin: 0.3, end : 1.0)), child: child, alignment: Alignment.center,);
    },

  );
}