import 'package:meta/meta_meta.dart';

import 'package:ice_annotation/src/methods/method.dart';

@Target({TargetKind.field})
class IgnoreProp extends Method {
  const IgnoreProp();
}