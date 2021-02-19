import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entities/cart_item/cart_item.dart';
import '../../entities/item/item.dart';

// freezed.dartをつくるため
part 'cart_state.freezed.dart';

// 抽象クラス
@freezed
abstract class CartState implements _$CartState {
  // factory
  // Cartの状態　→　カートアイテムとアイテム数を管理
  factory CartState({
    @Default(<int, CartItem>{}) Map<int, CartItem> itemMap,
  }) = _CartState;

  CartState._();

  // idでソートした状態のCartItemリスト
  @late
  List<CartItem> get sortedItem =>
      itemMap.values.toList()..sort((a, b) => a.item.id.compareTo(b.item.id));

  @late
  CartSummary get summary => CartSummary(
        quantity: itemMap.values.fold<int>(0, (sum, e) => sum + e.quantity),
        totalPrice: itemMap.values
            .fold<int>(0, (sum, e) => sum + e.item.price * e.quantity),
      );

  // 一致しているアイテムが存在すれば返す
  // TODO:nullがかえってくるかもしれない
  CartItem cartItem(Item item) {
    return sortedItem.length > 0
        ? sortedItem.firstWhere((element) => element == item)
        : null;
  }
}

// 抽象クラス
@freezed
abstract class CartSummary with _$CartSummary {
  // TODO: これはwithなんだよなぁ・・
  // 量と合計金額を管理
  factory CartSummary({
    @Default(0) int quantity,
    @Default(0) int totalPrice,
  }) = _CartSummary;

  @late
  String get state => 'カート($quantity)';

  @late
  String get totalPriceState => '合計金額 $totalPrice円+税';
}
