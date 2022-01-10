// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: cast_nullable_to_non_nullable,unnecessary_raw_strings,annotate_overrides,require_trailing_commas,unnecessary_cast,implicit_dynamic_type,lines_longer_than_80_chars

part of '../ice_generic_copy_with_ctor.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class _$Example<T> {
  const _$Example();

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
    _$CopyCallback<String>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example.named(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$Example2<T> {
  const _$Example2();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example2 copyWith({
    _$CopyCallback<String>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example2.named(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

abstract class _$Example3<T> {
  const _$Example3();

  @TConv<T>()
  T get name;
  int get code;
  bool get flag;

  /// 'null' safe
  ///
  /// ```dart
  /// myClass.copyWith(field: (currentValue) => newValue);
  /// ```
  Example3 copyWith({
    _$CopyCallback<String>? name,
    _$CopyCallback<int>? code,
    _$CopyCallback<bool>? flag,
  }) {
    return Example3.named(name == null ? this.name : name(this.name),
        code: code == null ? this.code : code(this.code),
        flag: flag == null ? this.flag : flag(this.flag));
  }
}

typedef _$CopyCallback<T> = T Function(T);
