import 'package:ice_annotation/ice.dart';

part 'main.g.dart';
part 'main.ice.dart';
// part 'example_main.ice.dart';

@Ice()
class _$Example {
  const _$Example(
    this.name, {
    this.age,
    this.isMale,
    this.friends,
    this.data,
    this.father,
  });

  final String? name;
  final int? age;
  final bool? isMale;
  final List<String>? friends;
  final Map<String, dynamic>? data;
  final _Example? father;
}
