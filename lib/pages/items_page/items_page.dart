import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        body: Container(),
      ),
    );
  }
}
