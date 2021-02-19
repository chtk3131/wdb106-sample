import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../entities/cart_item/cart_item.dart';
import '../../entities/item/item.dart';
import 'cart_state.dart';
export 'cart_state.dart';

// providerを定義
final cartProvider = StateNotifierProvider((ref) => CartController());

class CartController extends StateNotifier<CartState> {
  CartController() : super(CartState());

  // すでにリストに存在するアイテムなら個数（quantity）を１つ増やす
  // 新規ならItemインスタンスを追加
  void add(Item item) {
    // もう少しシンプルにする
    var contain = state.itemMap.containsKey(item.id);

    CartItem target;
    if (contain) {
      target = state.itemMap[item.id];
    } else {
      target = CartItem(
        item: item,
        quantity: 0, //どのみち増加させるので、初期値0
      );
    }

    target = target.increased();

    state = state.copyWith(
      itemMap: {
        ...state.itemMap,
        item.id: target,
      },
    );
  }

  void delete(Item item) {
    state = state.copyWith(
        itemMap: {
      ...state.itemMap,
      item.id: state.itemMap[item.id] == null
          ? 0
          : state.itemMap[item.id].decreased(),
    }..removeWhere((key, value) => value.quantity <= 0));
  }
}
