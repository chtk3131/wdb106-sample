import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// カートに遷移するボタン
// カートに入っている商品数を表示するため、状態管理が必要

class CartButton extends HookWidget {
  const CartButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: null,
    );
  }
}
