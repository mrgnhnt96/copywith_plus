import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:copywith_annotation/copywith.dart';
import 'package:copywith_plus/src/domain/domain.dart';
import 'package:copywith_plus/src/templates/templates.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';

/// {@template ice_generator}
/// A [Generator] that generates a [Ice] class for a given [ClassElement].
/// {@endtemplate}
class IceGenerator extends GeneratorForAnnotation<Ice> {
  /// {@macro ice_generator}
  const IceGenerator()
      : _path = 'graphql.yaml',
        super();

  static Map<String, Class> subjects = {};

  void addSubject(Class subject) {
    subjects[subject.name] = subject;
  }

  /// Used to set the path to the `graphql.yaml` file.
  ///
  /// Used for testing purposes only.
  @visibleForTesting
  const IceGenerator.manual(String fileName, {String? dir})
      : _path = '${dir == null ? '' : '$dir/'}$fileName.yaml',
        super();

  final String _path;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    print(_path);
    print(element);
    print(annotation);
    print(buildStep);

    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Generator cannot target `${element.runtimeType}`.',
        element: element,
      );
    }

    final subject = Class.fromElement(element);
    addSubject(subject);

    final ice = IceTemplate.forSubject(subject);

    final result = ice.toString();

    return result;
  }
}

abstract class Unions {
  Map<String, List<Class>> _unions = {};

  List<Class> getSubjects(String base);
  void addSubject(Class subject) {
    if (!subject.isIceUnion) {
      return;
    }

    // _unions[] ??= [];
  }
}

// extension on Class {
//   String get unionType {
//     // TODO: get union base class name from annotation
//     if ()
//   }
// }