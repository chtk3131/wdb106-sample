import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wdb106_sample/model/controllers/controllers.dart';
import 'cart_button.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text("商品リスト"),
          leading: CartButton(),
        ),
        body: _ListView(),
      ),
    );
  }
}

class _ListView extends HookWidget {
  const _ListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 商品データのロード中か確認
    final isLoading =
        useProvider(itemsProvider.state.select((value) => value.isLoading));
    // 商品のIDリストを取得
    final ids = useProvider(itemsProvider.state
        .select((value) => value.stocks.map((e) => e.item.id)));

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: ids.length,
            itemBuilder: (_, index) {});
  }
}
