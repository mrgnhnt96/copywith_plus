// ignore_for_file: comment_references, implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/element/element.dart';
import 'package:ice_annotation/src/ice.dart';

part 'annotation_types.ge.dart';

/// The different types of annotations that can be applied to a class
enum AnnotationTypes {
  /// [Ice]
  ice,

  /// [JsonSerializable]
  jsonSerializable,

  /// [JsonKey]
  jsonKey,

  /// [IceUnion]
  unionCreate,

  /// [IceUnion]
  unionOf,

  /// [CopyWithConstructor]
  copyWithConstructor,

  /// [Props]
  iceProps,

  /// [IgnoreProp]
  iceIgnoreProp,

  /// [ToString]
  iceToString,

  /// [IceCopyWith]
  copyWithSimple,

  /// [CopyWithTypeSafe]
  copyWithTypeSafe,

  /// [IceJsonConstructor]
  iceJsonConstructor,

  /// any other annotation
  other,
}

/// ext on [ElementAnnotation] to check for the annotation type
extension ElementAnnotationListX on Iterable<ElementAnnotation> {
  /// check for the annotation type
  bool containsAnnotation(AnnotationTypes type) {
    const conv = AnnotationTypesConv.nullable;

    return any((e) {
      final name = (e as ElementAnnotationImpl).annotationAst.name.name;
      final result = conv.fromJson(name);

      return result != null;
    });
  }
}

/// ext to check for the annotation type
extension AnnotationTypesListX on Set<Object> {
  /// gets the annotation type from the [ElementAnnotation]
  AnnotationTypes? getAnnotationFrom(ElementAnnotation annotation) {
    final name = (annotation as ElementAnnotationImpl).annotationAst.name.name;

    if (!contains(name)) {
      return null;
    }

    const conv = AnnotationTypesConv.nullable;

    return conv.fromJson(name);
  }
}

/// Annotations for [AnnotatinTypesX]
extension AnnotationTypesXX on AnnotationTypes {
  /// The [Ice] annotation
  bool get isIce => this == AnnotationTypes.ice;

  /// The [IceUnion] annotation
  bool get isUnionBase => this == AnnotationTypes.unionCreate;

  /// The [JsonKey] annotation
  bool get isJsonKey => this == AnnotationTypes.jsonKey;

  /// The [IceUnion] annotation
  bool get isUnionOf => this == AnnotationTypes.unionOf;

  /// The [CopyWithConstructor] annotation
  bool get isCopyWithConstructor => this == AnnotationTypes.copyWithConstructor;

  /// The [Props] annotation
  bool get isProps => this == AnnotationTypes.iceProps;

  /// The [IgnoreProp] annotation
  bool get isIgnoreProp => this == AnnotationTypes.iceIgnoreProp;

  /// The [ToString] annotation
  bool get isToString => this == AnnotationTypes.iceToString;

  /// The [IceCopyWith] annotation
  bool get isCopyWithSimple => this == AnnotationTypes.copyWithSimple;

  /// The [CopyWithTypeSafe] annotation
  bool get isCopyWithTypeSafe => this == AnnotationTypes.copyWithTypeSafe;

  /// The [IceJsonConstructor] annotation
  bool get isIceJsonConstructor => this == AnnotationTypes.iceJsonConstructor;

  /// any other annotation
  bool get isOther => this == AnnotationTypes.other;

  /// The [JsonSerializable] annotation
  bool get isJsonSerializable => this == AnnotationTypes.jsonSerializable;
}
