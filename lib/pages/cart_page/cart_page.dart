import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/components/components.dart';
import 'package:wdb106_sample/model/controllers/cart_controller/cart_controller.dart';
import 'package:wdb106_sample/pages/cart_page/cart_header.dart';
import 'package:wdb106_sample/pages/cart_page/cart_tile.dart';

// true or falseを返すProvider
// カート内に何もなくなったら強制的に商品一覧ページに遷移するように
final _shouldPop = Provider.autoDispose((ref) {
  return ref.watch(cartProvider.state).summary.totalPrice <= 0;
});

class CartPage extends HookWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void pop() => Navigator.of(context).pop();

    return ProviderListener(
      onChange: (context, bool shouldPop) {
        if (shouldPop) {
          pop();
        }
      },
      provider: _shouldPop,
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: const Text("カート"),
          leading: NavigationBarButton(
            onPressed: pop,
            text: "閉じる",
          ),
        ),
        body: Column(
          children: const [
            CartHeader(),
            Expanded(child: _ListView()),
          ],
        ),
      ),
    );
  }
}

class _ListView extends HookWidget {
  const _ListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems =
        useProvider(cartProvider.state.select((value) => value.sortedItem));

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: cartItems.length,
      itemBuilder: (_, index) {
        return CartTile(cartItem: cartItems[index]);
      },
    );
  }
}
