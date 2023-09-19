import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';

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