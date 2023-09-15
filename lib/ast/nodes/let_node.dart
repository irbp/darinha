import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/parameter_node.dart';

final class LetNode extends Node {
  LetNode({
    required this.name,
    required this.value,
    required this.next,
    required super.location,
  });

  final ParameterNode name;
  final Node value;
  final Node next;

  factory LetNode.fromMap(Map<String, dynamic> map) {
    return LetNode(
      name: ParameterNode.fromMap(map['name']),
      value: Node.fromMap(map['value']),
      next: Node.fromMap(map['next']),
      location: Location.fromMap(map['location']),
    );
  }
}
