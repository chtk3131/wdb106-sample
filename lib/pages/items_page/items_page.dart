import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text("商品リスト"),
          leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
          ),
        ),
        body: _ListView(),
      ),
    );
  }
}

class _ListView extends HookWidget {
  const _ListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(),
    );
  }
}
