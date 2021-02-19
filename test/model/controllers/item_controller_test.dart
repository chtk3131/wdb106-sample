import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/model/api.dart';
import 'package:wdb106_sample/model/controllers/controllers.dart';
import 'package:wdb106_sample/model/model.dart';

void main() {
  ItemController target;

  // ItemStockを定義
  final item = ItemStock(
    item: Item(
      id: 1,
      title: "test",
      price: 101,
      imageUrl: "http://example.com",
    ),
    quantity: 1,
  );

  setUp(() {
    // ProviderContainer
    final container = ProviderContainer(
      // overridevalueによって、中身を強制的に
      // 上で定義したitemのみになっている状態？
      overrides: [
        itemsFetcher.overrideWithValue(AsyncValue.data([item])),
      ],
    );
    target = container.read(itemsProvider);
  });

  // 事前準備が必要なようだ
  test("ItemController test", () {
    // コンストラクタを定義している時点で、
    // データ取得処理が走っているはず
    final stocks = target.debugState.stocks;

    expect(stocks.length, 1);
    expect(stocks.first.quantity, 1);
    expect(stocks.first.item, item.item);
  });
}
