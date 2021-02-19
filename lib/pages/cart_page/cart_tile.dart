import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wdb106_sample/components/item_image.dart';
import 'package:wdb106_sample/components/item_info.dart';
import '../../model/model.dart';

class CartTile extends HookWidget {
  const CartTile({
    Key key,
    @required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;
  Item get item => cartItem.item;

  static const _indent = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: _indent),
          height: 96,
          child: Row(
            children: [
              ItemImage(
                imageUrl: item.imageUrl,
              ),
              const SizedBox(
                width: 8,
              ),
              _itemInfo(context),
              _deleteButton(context),
            ],
          ),
        ),
        const Divider(indent: _indent),
      ],
    );
  }

  Widget _itemInfo(BuildContext context) {
    final theme = Theme.of(context);

    return ItemInfo(
      title: item.title,
      price: item.priceWithUnit,
      info: Text(
        "数量 ${cartItem.quantity}",
        style: theme.textTheme.caption,
      ),
    );
  }

  Widget _deleteButton(BuildContext context) {
    return CupertinoButton(
      child: Text("削除"),
      onPressed: () {
        context.read(cartProvider).delete(item);
      },
    );
  }
}
