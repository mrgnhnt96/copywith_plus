// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file:

part of 'main.dart';

// **************************************************************************
// IceGenerator
// **************************************************************************

abstract class State extends $State with EquatableMixin {
  State() : super();

  @override
  String toString() {
    return 'State{}';
  }

  @override
  List<Object?> get props {
    return [];
  }
}

@JsonSerializable()
class _Initial extends _$Initial with EquatableMixin {
  _Initial() : super();

  factory _Initial.fromJson(Map<String, dynamic> json) =>
      _$InitialFromJson(json);

  Map<String, dynamic> toJson() => _$InitialToJson(this);

  @override
  String toString() {
    return '_Initial{}';
  }

  @override
  List<Object?> get props {
    return [];
  }

  _Initial copyWith() {
    return _Initial();
  }
}

@JsonSerializable()
class _Ready extends _$Ready with EquatableMixin {
  _Ready(String data)
      : super(
          data,
        );

  factory _Ready.fromJson(Map<String, dynamic> json) => _$ReadyFromJson(json);

  Map<String, dynamic> toJson() => _$ReadyToJson(this);

  @override
  String toString() {
    return '_Ready{data: ${data}}';
  }

  @override
  List<Object?> get props {
    return [data];
  }

  _Ready copyWith({
    String? data,
  }) {
    _Ready _copyWith({
      Object? data,
    }) {
      return _Ready(
        data == kCopyWithDefault ? this.data : data as String,
      );
    }

    return _copyWith(
      data: data,
    );
  }
}

@JsonSerializable()
class _Error extends _$Error with EquatableMixin {
  _Error(String data, String fix, String message)
      : super(
          data,
          fix,
          message,
        );

  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return '_Error{data: ${data}, message: ${message}, fix: ${fix}}';
  }

  @override
  List<Object?> get props {
    return [data, message, fix];
  }

  _Error copyWith({
    String? data,
    String? fix,
    String? message,
  }) {
    _Error _copyWith({
      Object? data,
      Object? fix,
      Object? message,
    }) {
      return _Error(
        data == kCopyWithDefault ? this.data : data as String,
        fix == kCopyWithDefault ? this.fix : fix as String,
        message == kCopyWithDefault ? this.message : message as String,
      );
    }

    return _copyWith(
      data: data,
      fix: fix,
      message: message,
    );
  }
}

typedef _Result<R, T extends $State> = R Function(T);
typedef _NoResult<R> = R Function();

mixin _$StateUnion {
  R map<R extends Object?>(
      {required _Result<R, _Initial> initial,
      required _Result<R, _Ready> ready,
      required _Result<R, _Error> error}) {
    switch (this.runtimeType) {
      case _Initial:
        return initial(this as _Initial);
      case _Ready:
        return ready(this as _Ready);
      case _Error:
        return error(this as _Error);
      default:
        throw UnsupportedError('Unsupported type: $this');
    }
  }

  R maybeMap<R extends Object?>(
      {_Result<R, _Initial>? initial,
      _Result<R, _Ready>? ready,
      _Result<R, _Error>? error,
      required _NoResult<R> orElse}) {
    return map(
        initial: (state) => initial?.call(state) ?? orElse(),
        ready: (state) => ready?.call(state) ?? orElse(),
        error: (state) => error?.call(state) ?? orElse());
  }

  R? mapOrNull<R extends Object?>(
      {_Result<R, _Initial>? initial,
      _Result<R, _Ready>? ready,
      _Result<R, _Error>? error}) {
    return map(
        initial: (state) => initial?.call(state),
        ready: (state) => ready?.call(state),
        error: (state) => error?.call(state));
  }

  R when<R extends Object?>(
      {required R Function() initial,
      required R Function(String data) ready,
      required R Function(String data, String message, String fix) error}) {
    return map(
        initial: (state) => initial(),
        ready: (state) => ready(state.data),
        error: (state) => error(state.data, state.message, state.fix));
  }

  R maybeWhen<R extends Object?>(
      {R Function()? initial,
      R Function(String data)? ready,
      R Function(String data, String message, String fix)? error,
      required _NoResult<R> orElse}) {
    return map(
        initial: (state) => initial?.call() ?? orElse(),
        ready: (state) => ready?.call(state.data) ?? orElse(),
        error: (state) =>
            error?.call(state.data, state.message, state.fix) ?? orElse());
  }

  R? whenOrNull<R extends Object?>(
      {R Function()? initial,
      R Function(String data)? ready,
      R Function(String data, String message, String fix)? error}) {
    return map(
        initial: (state) => initial?.call(),
        ready: (state) => ready?.call(state.data),
        error: (state) => error?.call(state.data, state.message, state.fix));
  }

  bool get isInitial => this is _Initial;
  bool get isReady => this is _Ready;
  bool get isError => this is _Error;
}
_$StateUnionFromJson(Map<String, dynamic> json, [$State? orElse]) {
  switch (json['runtimeType'] as String?) {
    case '_Initial':
      return _Initial.fromJson(json);
    case '_Ready':
      return _Ready.fromJson(json);
    case '_Error':
      return _Error.fromJson(json);
    default:
      if (orElse != null) return orElse;

      throw UnsupportedError('Unsupported type: $json');
  }
}

Map<String, dynamic> _$StateUnionToJson($State instance,
    {bool includeRuntimeType = true}) {
  final runtimeTypeMap = <String, dynamic>{};
  if (includeRuntimeType) {
    runtimeTypeMap['runtimeType'] = '${instance.runtimeType}';
  }

  return instance.map(
      initial: (initial) => initial.toJson()..addAll(runtimeTypeMap),
      ready: (ready) => ready.toJson()..addAll(runtimeTypeMap),
      error: (error) => error.toJson()..addAll(runtimeTypeMap));
}
