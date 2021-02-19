import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/components/item_image.dart';
import 'package:wdb106_sample/components/item_info.dart';
import 'package:wdb106_sample/pages/items_page/tile/item_tile_controller.dart';

// 商品一覧画面に表示するタイルWidget
// 商品画像、商品名、値段、在庫、カートに追加ボタンなどを表示
final itemTileProviders = StateNotifierProvider.autoDispose
    .family<ItemTileController, int>((ref, id) {
  return ItemTileController(ref.read, id: id);
});

class ItemTile extends HookWidget {
  const ItemTile({
    Key key,
    @required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    const indent = 16.0;

    // 内容を表示するアイテム
    final item = useProvider(itemTileProviders(id)).stock.item;
    // 表示アイテムの在庫数
    final quantity = useProvider(
        itemTileProviders(id).state.select((value) => value.quantity));

    // 親Widgetと同じテーマ
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: indent),
          height: 96,
          child: Row(
            children: [
              // 横に並べるのは、画像とそれ以外
              // 画像情報
              ItemImage(
                imageUrl: item.imageUrl,
              ),
              const SizedBox(
                width: 8,
              ),
              // 商品情報
              ItemInfo(
                title: item.title,
                price: item.priceWithUnit,
                // 在庫
                info: Text(
                  "在庫 $quantity",
                  style: theme.textTheme.caption,
                ),
              ),
              // 追加ボタン
              _AddButton(id: id),
            ],
          ),
        ),
        const Divider(
          indent: indent,
        ),
      ],
    );
  }
}

class _AddButton extends HookWidget {
  const _AddButton({
    Key key,
    @required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(itemTileProviders(id));

    final hasStock = useProvider(
        itemTileProviders(id).state.select((value) => value.hasStock));

    return CupertinoButton(
      // 変化させる必要がないのでconst
      child: const Text("追加"),
      // 在庫があれば「追加」可能、なければ無理
      onPressed: hasStock ? controller.addToCart : null,
    );
  }
}
