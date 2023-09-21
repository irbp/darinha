import 'location.dart';
import 'node.dart';

final class PrintNode extends Node {
  PrintNode({
    required super.location,
    required this.value,
  });

  final Node value;

  factory PrintNode.fromMap(Map<String, dynamic> map) {
    return PrintNode(
      location: Location.fromMap(map['location']),
      value: Node.fromMap(map['value']),
    );
  }
}
