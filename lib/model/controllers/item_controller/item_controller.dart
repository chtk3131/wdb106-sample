import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:wdb106_sample/model/api.dart';

import '../../model.dart';
import 'item_state.dart';
export 'item_state.dart';

// ignore: top_level_function_literal_block
final itemsProvider = StateNotifierProvider((ref) {
  return ItemController(ref.read);
});

class ItemController extends StateNotifier<ItemState> {
  // コンストラクタ時に非同期実行？
  ItemController(this._read) : super(ItemState()) {
    () async {
      state = state.copyWith(
        stocks: await _read(itemsFetcher.future),
        isLoading: false,
      );
    }();
  }

  final Reader _read;
}
