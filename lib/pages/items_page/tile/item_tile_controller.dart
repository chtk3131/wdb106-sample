import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/model/controllers/controllers.dart';
import 'package:wdb106_sample/model/model.dart';

import 'item_tile_state.dart';

// 在庫状況を変化させる
// 在庫は問い合わせないとリアルな状況把握ができない
// 定義するたび通信
class ItemTileController extends StateNotifier<ItemTileState> {
  ItemTileController(
    this._read, {
    @required this.id,
  }) : super(ItemTileState()) {
    _cartControllerRemoveListener =
        _read(cartProvider).addListener((cartState) {
      final cartItem = cartState.cartItem(stock.item);
      if (cartItem == null) return;
      final cartItemQuantity = cartItem.quantity ?? 0;
      state = state.copyWith(quantity: stock.quantity - cartItemQuantity);
    });
  }

  final Reader _read;
  final int id;

  VoidCallback _cartControllerRemoveListener;

  ItemStock get stock => _read(itemsProvider).state.stock(id);

  void addToCart() => _read(cartProvider).add(stock.item);

  @override
  void dispose() {
    _cartControllerRemoveListener();
    super.dispose();
  }
}
