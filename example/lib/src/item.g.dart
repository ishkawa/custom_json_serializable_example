// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    json['name'] as String,
    json['createdAt'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'createdAt': instance.createdAt?.millisecondsSinceEpoch,
    };
