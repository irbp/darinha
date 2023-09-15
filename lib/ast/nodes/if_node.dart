import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';

final class IfNode extends Node {
  final Node condition;
  final Node then;
  final Node otherwise;

  IfNode({
    required this.condition,
    required this.then,
    required this.otherwise,
    required super.location,
  });

  factory IfNode.fromMap(Map<String, dynamic> map) {
    return IfNode(
      condition: Node.fromMap(map['condition']),
      then: Node.fromMap(map['then']),
      otherwise: Node.fromMap(map['otherwise']),
      location: Location.fromMap(map['location']),
    );
  }
}
