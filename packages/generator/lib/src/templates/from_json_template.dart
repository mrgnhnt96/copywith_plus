// ignore_for_file: unused_field, public_member_api_docs

import 'package:build/build.dart';
import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/domain/generic_param.dart';
import 'package:ice/src/domain/ice_support.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

extension on GenericParam {
  String get callback {
    return '_\$${name}Callback';
  }

  String get fromJsonName {
    return 'fromJson$name';
  }

  String get callbackParam {
    if (!isPrimitive) {
      return 'required $callback<$name> $fromJsonName';
    }
    return '$callback<$name>? $fromJsonName';
  }

  String get defaultCallback {
    if (!isPrimitive) {
      return '';
    }

    return '(val) => val as $name';
  }

  String get callbackArg {
    if (!isPrimitive) {
      return fromJsonName;
    }
    return '$fromJsonName ?? $defaultCallback';
  }
}

extension on Iterable<GenericParam> {
  Iterable<String> get support {
    return map((e) {
      return 'typedef ${e.callback}<T> = '
          '${e.name} Function(Object?);';
    });
  }
}

extension on Class {
  Iterable<String> get fieldGetters {
    final getters = <String>[];

    for (final field in fields) {
      getters.add('${field.type} get ${field.name};');
    }

    return getters;
  }

  Constructor? get fromJsonConstructor {
    return constructorWhere((e) => e.isJsonConstructor);
  }

  Iterable<String> get genericArgs {
    if (generics.isEmpty) {
      return [];
    }

    final args = <String>[];

    for (final generic in generics) {
      args.add('fromJson${generic.name}');
    }
    return args;
  }

  Iterable<String> get genericParams {
    if (generics.isEmpty) {
      return [];
    }

    final args = <String>[];

    for (final generic in generics) {
      args.add(generic.callbackParam);
    }

    return args;
  }
}

class FromJsonTemplate extends Template {
  const FromJsonTemplate.forSubject(Class subject)
      : unions = const [],
        super(subject, templateType: TemplateType.fromJson);
  const FromJsonTemplate.forUnion(Class subject, this.unions)
      : super(subject, templateType: TemplateType.fromJson);

  final Iterable<Class> unions;

  static const String fromJsonAccessor = r'_$fromJson';

  /// generates the constructor that json_serializable uses
  /// to create the object from json
  void fromJsonAccessConstructor(StringBuffer buffer) {
    final iceJsonSerializable = subject.annotations.ice?.jsonSerializable;
    final createFactoryForJson = iceJsonSerializable?.createFactory ?? true;
    final constructor = subject.fromJsonConstructor;

    if (iceJsonSerializable == null ||
        constructor == null ||
        !createFactoryForJson) {
      return;
    }

    final constStr = constructor.isConst ? 'const ' : '';

    buffer.write(
      '${constStr}factory ${subject.genName}.$fromJsonAccessor'
      '${constructor.paramsString}'
      '= ${constructor.displayName};',
    );
  }

  /// generates the accessor for the fromJson factory
  /// that json_serializable uses
  ///
  /// generates the fromJson factory that is referenced by the union
  /// if the subject doesn't have a fromJson factory
  void writeConstructors(StringBuffer buffer) {
    if (!canBeGenerated) {
      return;
    }

    void writeConstructor() {
      final constructor = subject.fromJsonConstructor;

      if (constructor == null) {
        log.info(
          'this class has no constructors, but it should because '
          'we need to get the default constructor',
        );
        return;
      }

      var returnType = '_\$\$${subject.cleanName}FromJson';

      if (subject.annotations.isContainedUnion) {
        returnType = '_\$${subject.cleanName}FromJson';
      }

      var typeParams = '';
      var typeArgs = '';

      if (subject.generics.isNotEmpty) {
        final params = subject.generics.map((e) => e.callbackParam).join(', ');
        typeParams = ', {$params}';

        final args = subject.generics.map((e) => e.callbackArg).join(', ');
        typeArgs = ', $args';
      }

      buffer.write(
        'factory ${subject.genName}'
        '.fromJson(Map<String, dynamic> json$typeParams) => '
        '$returnType(json$typeArgs);',
      );
    }

    if (!subject.doNotGenerate.fromJsonConstructor) {
      if (subject.annotations.isUnionAnnotation) {
        writeConstructor();
        buffer.writepln();
      }
    }
    fromJsonAccessConstructor(buffer);
    buffer.writepln();
  }

  void _writeAsUnion(StringBuffer buffer) {
    buffer.writeObject(
      '${subject.name} _\$${subject.name}FromJson(Map<String, dynamic> json, '
      '[${subject.name}? defaultValue])',
      body: () {
        final unionKey = subject.annotations.union!.unionKey;
        buffer.writeObject(
          "switch(json[r'$unionKey'] as String?)",
          body: () {
            for (final union in unions) {
              var fromJsonAccess = union.name;
              final unionId = union.annotations.union!.unionId ?? union.name;

              if (!union.doNotGenerate.fromJsonConstructor) {
                fromJsonAccess = union.genName;
              }
              buffer
                ..writepln("case r'$unionId':")
                ..writepln('return $fromJsonAccess.fromJson(json);');
            }

            buffer
              ..writepln('default:')
              ..writeObject(
                'if (defaultValue != null)',
                body: () {
                  buffer.writepln('return defaultValue;');
                },
              )
              ..writepln('throw FallThroughError();');
          },
        );
      },
    );
  }

  void _writeFromJson(StringBuffer buffer) {
    bool canWrite() {
      if (!subject.annotations.isUnionAnnotation) {
        return true;
      }

      if (!subject.doNotGenerate.fromJsonConstructor) {
        return false;
      }

      return true;
    }

    if (!canWrite()) {
      return;
    }

    buffer.writeObject(
      // ignore: missing_whitespace_between_adjacent_strings
      '${subject.name} _\$${subject.nonPrivateName}FromJson'
      '(Map<String, dynamic> json)',
      body: () {
        buffer.writepln(
          'return _\$\$${subject.nonPrivateName}FromJson(json) '
          'as ${subject.name};',
        );
      },
    );
  }

  @override
  void generate(StringBuffer buffer) {
    IceSupport().addAll(subject.generics.support);

    if (subject.annotations.isUnionBase) {
      if (unions.isNotEmpty) {
        _writeAsUnion(buffer);
      }
    } else {
      _writeFromJson(buffer);
    }
  }
}
