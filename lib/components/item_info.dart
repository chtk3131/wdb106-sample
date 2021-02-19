import 'package:flutter/material.dart';

// 商品情報を表示するためのWidget
// タイトル、価格、info(?)

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
    @required this.title,
    @required this.price,
    @required this.info,
  }) : super(key: key);

  final String title;
  final String price;
  final Widget info;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyleMain = theme.textTheme.subtitle1;

    return Expanded(
      // 情報は縦に並べるのでColumn
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyleMain,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              price,
              style: textStyleMain,
            ),
          ),
          info,
        ],
      ),
    );
  }
}
