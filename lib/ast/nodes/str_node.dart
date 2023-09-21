import '../val.dart';
import 'location.dart';
import 'node.dart';

final class StrNode extends Node {
  StrNode({
    required super.location,
    required this.value,
  });

  final StrVal value;

  factory StrNode.fromMap(Map<String, dynamic> map) {
    return StrNode(
      location: Location.fromMap(map['location']),
      value: StrVal(value: map['value']),
    );
  }
}
