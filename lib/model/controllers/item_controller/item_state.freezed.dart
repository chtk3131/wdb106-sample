// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ItemStateTearOff {
  const _$ItemStateTearOff();

// ignore: unused_element
  _ItemState call(
      {List<ItemStock> stocks = const <ItemStock>[], bool isLoading = true}) {
    return _ItemState(
      stocks: stocks,
      isLoading: isLoading,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ItemState = _$ItemStateTearOff();

/// @nodoc
mixin _$ItemState {
  List<ItemStock> get stocks;
  bool get isLoading;

  @JsonKey(ignore: true)
  $ItemStateCopyWith<ItemState> get copyWith;
}

/// @nodoc
abstract class $ItemStateCopyWith<$Res> {
  factory $ItemStateCopyWith(ItemState value, $Res Function(ItemState) then) =
      _$ItemStateCopyWithImpl<$Res>;
  $Res call({List<ItemStock> stocks, bool isLoading});
}

/// @nodoc
class _$ItemStateCopyWithImpl<$Res> implements $ItemStateCopyWith<$Res> {
  _$ItemStateCopyWithImpl(this._value, this._then);

  final ItemState _value;
  // ignore: unused_field
  final $Res Function(ItemState) _then;

  @override
  $Res call({
    Object stocks = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      stocks: stocks == freezed ? _value.stocks : stocks as List<ItemStock>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
abstract class _$ItemStateCopyWith<$Res> implements $ItemStateCopyWith<$Res> {
  factory _$ItemStateCopyWith(
          _ItemState value, $Res Function(_ItemState) then) =
      __$ItemStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ItemStock> stocks, bool isLoading});
}

/// @nodoc
class __$ItemStateCopyWithImpl<$Res> extends _$ItemStateCopyWithImpl<$Res>
    implements _$ItemStateCopyWith<$Res> {
  __$ItemStateCopyWithImpl(_ItemState _value, $Res Function(_ItemState) _then)
      : super(_value, (v) => _then(v as _ItemState));

  @override
  _ItemState get _value => super._value as _ItemState;

  @override
  $Res call({
    Object stocks = freezed,
    Object isLoading = freezed,
  }) {
    return _then(_ItemState(
      stocks: stocks == freezed ? _value.stocks : stocks as List<ItemStock>,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading as bool,
    ));
  }
}

/// @nodoc
class _$_ItemState extends _ItemState {
  _$_ItemState({this.stocks = const <ItemStock>[], this.isLoading = true})
      : assert(stocks != null),
        assert(isLoading != null),
        super._();

  @JsonKey(defaultValue: const <ItemStock>[])
  @override
  final List<ItemStock> stocks;
  @JsonKey(defaultValue: true)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ItemState(stocks: $stocks, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemState &&
            (identical(other.stocks, stocks) ||
                const DeepCollectionEquality().equals(other.stocks, stocks)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stocks) ^
      const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$ItemStateCopyWith<_ItemState> get copyWith =>
      __$ItemStateCopyWithImpl<_ItemState>(this, _$identity);
}

abstract class _ItemState extends ItemState {
  _ItemState._() : super._();
  factory _ItemState({List<ItemStock> stocks, bool isLoading}) = _$_ItemState;

  @override
  List<ItemStock> get stocks;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$ItemStateCopyWith<_ItemState> get copyWith;
}
