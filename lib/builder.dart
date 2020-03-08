library custom_json_serializable;

import 'package:build/build.dart';
import 'package:custom_json_serializable/src/unixmillisecond_helper.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:source_gen/source_gen.dart';

Builder customJsonSerializable(BuilderOptions options) {
  try {
    final config = JsonSerializable.fromJson(options.config);
    return SharedPartBuilder(
      [
        JsonSerializableGenerator(
          config: config,
          typeHelpers: [
            UnixmillisecondHelper(),
          ],
        ),
        const JsonLiteralGenerator()
      ],
      'custom_json_serializable',
    );
  } on CheckedFromJsonException catch (e) {
    final lines = <String>[
      'Could not parse the options provided for `json_serializable`.'
    ];

    if (e.key != null) {
      lines.add('There is a problem with "${e.key}".');
    }
    if (e.message != null) {
      lines.add(e.message);
    } else if (e.innerError != null) {
      lines.add(e.innerError.toString());
    }

    throw StateError(lines.join('\n'));
  }
}
