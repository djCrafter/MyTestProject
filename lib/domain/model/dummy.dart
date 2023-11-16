import 'package:meta/meta.dart';

@immutable
class Dummy {
  const Dummy({
    required this.id,
    required this.value,
  });

  final String id;
  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Dummy && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Dummy{id: $id, value: $value}';
  }
}
