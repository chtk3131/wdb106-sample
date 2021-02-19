import 'package:flutter/material.dart';

// 商品の画像キャプチャ
class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
