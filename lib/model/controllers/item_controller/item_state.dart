import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model.dart';

part 'item_state.freezed.dart';

@freezed
abstract class ItemState implements _$ItemState {
  // ItemStock自体を保持する
  factory ItemState({
    @Default(<ItemStock>[]) List<ItemStock> stocks,
    @Default(true) bool isLoading,
  }) = _ItemState;

  ItemState._();

  @late
  Map<int, ItemStock> get _map => Map.fromEntries(
        stocks.map((e) => MapEntry(e.item.id, e)),
      );

  ItemStock stock(int id) => _map[id];
}
