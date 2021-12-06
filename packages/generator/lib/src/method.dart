// ignore_for_file: implementation_imports

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/copy_with_template.dart';
import 'package:ice/src/templates/props_template.dart';
import 'package:ice/src/templates/to_string_template.dart';
import 'package:ice_annotation/src/methods/methods.dart';
import 'package:source_gen/source_gen.dart';

/// {@template copywith_generator}
/// A [Generator] that generates a [CopyWith] class for a given [ClassElement].
/// {@endtemplate}
class MethodGenerator extends GeneratorForAnnotation<Method> {
  /// {@macro copywith_generator}
  const MethodGenerator() : super();

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    // print(element);
    // print(annotation);
    // print(buildStep);

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.runtimeType}`.',
        element: element,
      );
    }

    final subject = Class.fromElement(element);

    if (copyWith) {
      final copyWith = CopyWithTemplate.forSubject(subject);
    }

    if (props) {
      final props = PropsTemplate.forSubject(subject);
    }

    if (toString) {
      final toString = ToStringTemplate.forSubject(subject);
    }

    final result = copyWith.toString();

    return result;
  }
}