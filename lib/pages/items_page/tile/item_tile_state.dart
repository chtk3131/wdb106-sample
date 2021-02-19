import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_tile_state.freezed.dart';

// タイルで表示する内容を管理
// 状態が変わるのは在庫のみ

@freezed
abstract class ItemTileState with _$ItemTileState {
  factory ItemTileState({
    @Default(0) int quantity,
  }) = _ItemTileState;

  ItemTileState._();

  @late
  bool get hasStock => quantity > 0;
}
