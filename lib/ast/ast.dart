import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';

class AST {
  AST._({
    required this.name,
    required this.program,
    required this.location,
  });

  final String name;
  final Node program;
  final Location location;
  final Map<String, Node> stack = {};

  factory AST.fromMap(Map<String, dynamic> map) {
    return AST._(
      name: map['name'],
      program: Node.fromMap(map['expression']),
      location: Location.fromMap(map['location']),
    );
  }
}
