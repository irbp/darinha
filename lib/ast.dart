import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

class AST {
  AST._({
    required this.name,
    required this.expression,
    required this.location,
  });

  final String name;
  final Term expression;
  final Location location;

  factory AST.fromMap(Map<String, dynamic> map) {
    return AST._(
      name: map['name'],
      expression: Term.fromMap(map['expression']),
      location: Location.fromMap(map['location']),
    );
  }

  Val eval() {
    return expression.eval();
  }
}
