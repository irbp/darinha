import 'location.dart';
import 'node.dart';

final class CallNode extends Node {
  CallNode({
    required this.callee,
    required this.arguments,
    required super.location,
  });

  final Node callee;
  final List<Node> arguments;

  factory CallNode.fromMap(Map<String, dynamic> map) {
    final arguments = map['arguments'] as List<dynamic>;
    return CallNode(
      callee: Node.fromMap(map['callee']),
      arguments: arguments.map((e) => Node.fromMap(e)).toList(),
      location: Location.fromMap(map['location']),
    );
  }
}
