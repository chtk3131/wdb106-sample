import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarButton extends StatelessWidget {
  const NavigationBarButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(text),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
    );
  }
}
