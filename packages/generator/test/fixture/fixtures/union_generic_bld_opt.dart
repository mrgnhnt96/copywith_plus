// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../union_generic.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example<T> extends State {
  const _$Example() : super();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example copyWith({
    _$CopyCallback<T>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$Other<T> extends State {
  const _$Other() : super();

  @TConv<T>()
  T get some;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Other copyWith({
    _$CopyCallback<T>? some,
  }) {
    return Other(some == null ? this.some : some(this.some));
  }
}

abstract class _$State with _$StateMixin {
  const _$State();
}

class _$StateTearOffs {
  const _$StateTearOffs();
  State example<T>(T name, {required int code, required bool flag}) {
    return Example<T>(name, code: code, flag: flag);
  }

  State other<T>(T some) {
    return Other<T>(some);
  }
}

mixin _$StateMixin {
  _$R map<_$R extends Object?>({
    required _$StateCallback<_$R, _$Example> example,
    required _$StateCallback<_$R, _$Other> other,
  }) {
    switch (runtimeType) {
      case _$Example:
        return example(this as _$Example);
      case _$Other:
        return other(this as _$Other);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  _$R when<_$R extends Object?>({
    required _$R Function<T>(
      T name,
      int code,
      bool flag,
    )
        example,
    required _$R Function<T>(
      T some,
    )
        other,
  }) {
    return map(
      example: (u) => example.call(
        u.name,
        u.code,
        u.flag,
      ),
      other: (u) => other.call(
        u.some,
      ),
    );
  }

  _$R maybeMap<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) => example?.call(u) ?? orElse(),
      other: (u) => other?.call(u) ?? orElse(),
    );
  }

  _$R maybeWhen<_$R extends Object?>({
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example,
    _$R Function<T>(
      T some,
    )?
        other,
    required _$NoStateCallback<_$R> orElse,
  }) {
    return map(
      example: (u) =>
          example?.call(
            u.name,
            u.code,
            u.flag,
          ) ??
          orElse(),
      other: (u) =>
          other?.call(
            u.some,
          ) ??
          orElse(),
    );
  }

  _$R? mapOrNull<_$R extends Object?>({
    _$StateCallback<_$R, _$Example>? example,
    _$StateCallback<_$R, _$Other>? other,
  }) {
    return map(
      example: (u) => example?.call(u),
      other: (u) => other?.call(u),
    );
  }

  _$R? whenOrNull<_$R extends Object?>({
    _$R Function<T>(
      T name,
      int code,
      bool flag,
    )?
        example,
    _$R Function<T>(
      T some,
    )?
        other,
  }) {
    return map(
      example: (u) => example?.call(
        u.name,
        u.code,
        u.flag,
      ),
      other: (u) => other?.call(
        u.some,
      ),
    );
  }

  Example get asExample {
    if (!isExample) {
      throw Exception('State runtimeType is not of type Example');
    }
    return this as Example;
  }

  Other get asOther {
    if (!isOther) {
      throw Exception('State runtimeType is not of type Other');
    }
    return this as Other;
  }

  bool get isExample => this is Example;
  bool get isOther => this is Other;
}
typedef _$CopyCallback<T> = T Function(T);
typedef _$StateCallback<_$R, _$T extends State> = _$R Function(_$T);
typedef _$NoStateCallback<_$R> = _$R Function();
