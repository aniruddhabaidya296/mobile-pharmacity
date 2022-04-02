// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharmacity/constants/size_config.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget(
      {Key key,
      this.child,
      this.controller,
      this.duration = const Duration(milliseconds: 100)})
      : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(listen);
  }

  void show() {
    if (!isVisible) {
      setState(
        () {
          isVisible = true;
        },
      );
    }
  }

  void hide() {
    if (isVisible) {
      setState(
        () {
          isVisible = false;
        },
      );
    }
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      show();
    } else if (direction == ScrollDirection.reverse) {
      hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedContainer(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      duration: widget.duration,
      child: widget.child,
      height: isVisible ? SizeConfig.blockWidth * 13 : 0,
    );
  }
}
