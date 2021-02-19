import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/model/controllers/cart_controller/cart_controller.dart';

// 合計金額を表示するためのWidget
class CartHeader extends HookWidget {
  const CartHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPrice = useProvider(
        cartProvider.state.select((value) => value.summary.totalPriceState));

    return Container(
      height: 55,
      color: Colors.grey[300],
      child: Center(
        child: Text(
          totalPrice,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
