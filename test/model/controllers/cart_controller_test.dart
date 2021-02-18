import 'package:flutter_test/flutter_test.dart';
import 'package:wdb106_sample/model/controllers/cart_controller/cart_controller.dart';
import 'package:wdb106_sample/model/entities/item/item.dart';

void main() {
  test("CartController test", () {
    final target = CartController();

    // CartStateのチェック
    // 空のはず
    expect(target.debugState.sortedItem, isEmpty);

    var summary = target.debugState.summary;

    // 初期値なので0
    expect(summary.state, 'カート(0)');
    expect(summary.totalPriceState, '合計金額 0円+税');

    // アイテムをセットしたときの状態
    final item = Item(
      id: 1,
      price: 101,
      title: "test",
      imageUrl: "https://exmaple.com",
    );
    // 追加前の状態を確認しておく
    expect(target.debugState.sortedItem, isEmpty);
    expect(summary.state, 'カート(0)');
    expect(summary.totalPriceState, '合計金額 0円+税');

    // 追加機能チェック
    target.add(item);
    // 追加後の要素が増えているはず
    expect(target.debugState.sortedItem.length, 1);
    // 追加した要素なのか確認
    final addItem = target.debugState.sortedItem.first;
    expect(addItem.item, item);
    expect(addItem.quantity, 1);
    summary = target.debugState.summary;
    expect(summary.state, 'カート(1)');
    expect(summary.totalPriceState, '合計金額 101円+税');

    // 削除機能チェック
    target.delete(item);
    expect(target.debugState.sortedItem.length, 0);
    summary = target.debugState.summary;
    expect(summary.state, 'カート(0)');
    expect(summary.totalPriceState, '合計金額 0円+税');
  });
}
