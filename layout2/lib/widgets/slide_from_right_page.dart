import 'package:flutter/material.dart';

class SlideFromRightPage extends PageRouteBuilder {
  final Widget widget;
  final int duration;

  SlideFromRightPage({this.widget, this.duration})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(1.0, 0.0),
                  ).animate(secondaryAnimation),
                  child: child,
                ),
              );
            });
  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => Duration(milliseconds: duration);
}
