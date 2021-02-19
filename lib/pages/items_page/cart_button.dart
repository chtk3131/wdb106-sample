import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/model/controllers/cart_controller/cart_controller.dart';
import 'package:wdb106_sample/pages/cart_page/cart_page.dart';
import '../../components/components.dart';

// カートに遷移するボタン
// カートに入っている商品数を表示するため、状態管理が必要

class CartButton extends HookWidget {
  const CartButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // カート内のアイテム数を取得
    final cartItemCountText =
        useProvider(cartProvider.state.select((value) => value.summary.state));
    return NavigationBarButton(
      text: cartItemCountText,
      onPressed: () {
        Navigator.of(context).push<void>(
          CupertinoPageRoute<void>(
            builder: (context) {
              return const CartPage();
            },
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
