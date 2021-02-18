import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../item/item.dart';

part 'cart_item.freezed.dart';

@freezed
abstract class CartItem implements _$CartItem {
  // TODO:withじゃないんだ・・？
  factory CartItem({
    @required Item item,
    @required int quantity,
  }) = _CartItem;

  // TODO:これはなに？
  // 名前付きprivateコンストラクタ、というらしい
  CartItem._();
}
