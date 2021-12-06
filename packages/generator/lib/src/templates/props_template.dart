import 'package:ice/src/domain/domain.dart';
import 'package:ice/src/templates/template.dart';
import 'package:ice/src/util/string_buffer_ext.dart';

class PropsTemplate extends Template {
  const PropsTemplate.forSubject(Class subject) : super(subject);

  void _writeAsOverride(StringBuffer buffer) {
    buffer
      ..writeln('@override')
      ..writeObject(
        'List<Object?> get props',
        body: () {
          _writeReturn(buffer);
        },
      );
  }

  void _writeAsPrivateFunction(StringBuffer buffer) {
    final genClassName = subject.generatedName(retainPrivate: false);

    buffer.writeObject(
      'List<Object?> _${genClassName}Props()',
      body: () {
        _writeReturn(buffer);
      },
    );
  }

  void _writeReturn(StringBuffer buffer) {
    buffer
      ..write('return [')
      ..writeAll(subject.fields.map<String>((e) => e.name), ', ')
      ..writeln('];');
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    _writeAsOverride(buffer);

    return buffer.toString();
  }

  @override
  void addToBuffer(StringBuffer buffer, {bool asOverride = true}) {
    if (asOverride) {
      _writeAsOverride(buffer);
    } else {
      _writeAsPrivateFunction(buffer);
    }
  }
}
