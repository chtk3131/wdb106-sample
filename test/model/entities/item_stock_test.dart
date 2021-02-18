import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import '../../../lib/model/entities/item/item.dart';
import '../../../lib/model/entities/item_stock/item_stock.dart';

void main() {
  test("ItemStock test", () async {
    // ItemStock自体のテスト
    final target = ItemStock(
      item: Item(
        id: 1,
        title: "test",
        price: 101,
        imageUrl: "http://example.com",
      ),
      quantity: 0,
    );

    expect(target.item.id, 1);
    expect(target.item.title, "test");
    expect(target.item.price, 101);
    expect(target.item.priceWithUnit, "101円+税");
    expect(target.item.imageUrl, "http://example.com");
    expect(target.quantity, 0);

    // jsonからインスタンスを生成する
    const source = '''
      {
        "id":100,
        "price":200,
        "title":"test",
        "imageUrl":"https://example.com",
        "quantity":5
      }
    ''';

    final json = jsonDecode(source) as Map<String, dynamic>;
    final decodeTarget = ItemStock.fromJson(json);
    expect(decodeTarget.item.id, 100);
    expect(decodeTarget.item.title, "test");
    expect(decodeTarget.item.price, 200);
    expect(decodeTarget.item.imageUrl, "https://example.com");
    expect(decodeTarget.quantity, 5);
  });
}
