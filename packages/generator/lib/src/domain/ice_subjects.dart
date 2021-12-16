// ignore_for_file: comment_references, implementation_imports

import 'package:ice/src/domain/domain.dart';
import 'package:ice_annotation/src/ice.dart';

/// {@template unions}
/// All classes that are annotated with [Ice]
/// {@endtemplate}
class IceSubjects {
  /// {@macro unions}
  IceSubjects() {
    _supertypes = {};
    _classes = {};
  }

  /// mapped by supertypes, contains a list of classes
  late final Map<String, List<Class>> _supertypes;

  /// mapped by class name, contains a class
  late final Map<String, Class> _classes;

  /// gets the classes assotiated with the union [base]
  List<Class> getUnions(Class base) {
    final className = base.name;
    return _supertypes[className] ?? [];
  }

  /// checks if the [subject] has been generated by ice
  bool hasGenerated(Class subject) => _classes.containsKey(subject.name);

  /// adds the [subject] to the list of [Ice] classes
  /// mapped by supertypes
  void add(Class subject) {
    _classes[subject.name] = subject;

    final union = subject.annotations.unionType;

    if (union == null) {
      return;
    }

    if (!_supertypes.containsKey(union)) {
      _supertypes[union] = [];
    }

    _supertypes[union]!.add(subject);
  }
}
