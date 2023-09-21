import '../val.dart';
import 'location.dart';
import 'node.dart';

final class BoolNode extends Node {
  BoolNode({
    required super.location,
    required this.value,
  });

  final BoolVal value;

  factory BoolNode.fromMap(Map<String, dynamic> map) {
    return BoolNode(
      location: Location.fromMap(map['location']),
      value: BoolVal(value: map['value']),
    );
  }
}
