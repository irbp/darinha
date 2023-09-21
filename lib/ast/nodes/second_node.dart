import 'location.dart';
import 'node.dart';

final class SecondNode extends Node {
  SecondNode({
    required this.value,
    required super.location,
  });

  final Node value;

  factory SecondNode.fromMap(Map<String, dynamic> map) {
    return SecondNode(
      value: Node.fromMap(map['value']),
      location: Location.fromMap(map['location']),
    );
  }
}
