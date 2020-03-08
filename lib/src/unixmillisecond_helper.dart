library custom_json_serializable;

import 'package:source_gen/source_gen.dart';
import 'package:json_serializable/type_helper.dart';
import 'package:analyzer/dart/element/type.dart';

class UnixmillisecondHelper extends TypeHelper {
  final _typeChecker = TypeChecker.fromUrl('dart:core#DateTime');

  UnixmillisecondHelper();

  @override
  String serialize(
    DartType targetType,
    String expression,
    TypeHelperContext context,
  ) {
    if (!_typeChecker.isExactlyType(targetType)) {
      return null;
    }

    if (context.nullable) {
      expression = '$expression?';
    }

    return '$expression.millisecondsSinceEpoch';
  }

  @override
  String deserialize(
    DartType targetType,
    String expression,
    TypeHelperContext context,
  ) {
    if (!_typeChecker.isExactlyType(targetType)) {
      return null;
    }

    return context.nullable
        ? '$expression == null ? null : DateTime.fromMillisecondsSinceEpoch($expression)'
        : 'DateTime.fromMillisecondsSinceEpoch($expression)';
  }
}
