import 'package:flutter_test/flutter_test.dart';

import '../../../lib/model/entities/item/item.dart';
import '../../../lib/model/entities/cart_item/cart_item.dart';

void main() {
  test("CartItem test", () async {
    // ダミーのCartItem作成
    final target = CartItem(
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
    expect(target.increased().quantity, 1);
    expect(target.quantity, 0);
    expect(target.increased().decreased().quantity, 0);
    expect(target.quantity, 0);
  });
}
