# custom_json_serializable_example

An example project that generates fromJson/toJson methods for custom types.

The root package of this repository is a code generator based on `json_serializable`. As an example of customization, this package also supports serialize/deserialize `DateTime` to UNIX milliseconds.

For example, suppose we have a class below:

```dart
@JsonSerializable()
class Item {
  String name;
  DateTime createdAt;

  Item(this.name, this.createdAt);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
```

An instance of this class `Item('Apple', DateTime(2020, 3, 8))` can be serialized into following JSON:

```json
{
    "name": "Apple",
    "createdAt": 1583593200000
}
```

In the example package, you can re-generate fromJson/toJson methods by `pub run build_runner build`.
