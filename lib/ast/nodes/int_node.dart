import '../val.dart';
import 'location.dart';
import 'node.dart';

final class IntNode extends Node {
  IntNode({
    required super.location,
    required this.value,
  });

  final IntVal value;

  factory IntNode.fromMap(Map<String, dynamic> map) {
    return IntNode(
      location: Location.fromMap(map['location']),
      value: IntVal(value: map['value']),
    );
  }
}
