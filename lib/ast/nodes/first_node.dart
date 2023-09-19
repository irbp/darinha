import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';

final class FirstNode extends Node {
  FirstNode({
    required this.value,
    required super.location,
  });

  final Node value;

  factory FirstNode.fromMap(Map<String, dynamic> map) {
    return FirstNode(
      value: Node.fromMap(map['value']),
      location: Location.fromMap(map['location']),
    );
  }
}
