import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../item/item.dart';

part 'item_stock.freezed.dart';

// 在庫？
@freezed
abstract class ItemStock implements _$ItemStock {
  factory ItemStock({
    @required Item item,
    @required int quantity,
  }) = _ItemStock;

  ItemStock._();

  static ItemStock fromJson(Map<String, dynamic> json) => ItemStock(
        item: Item.fromJson(json),
        quantity: json["quantity"] as int,
      );
}
