import 'nodes/location.dart';
import 'nodes/node.dart';

class AST {
  AST._({
    required this.name,
    required this.program,
    required this.location,
  });

  final String name;
  final Node program;
  final Location location;

  factory AST.fromMap(Map<String, dynamic> map) {
    return AST._(
      name: map['name'],
      program: Node.fromMap(map['expression']),
      location: Location.fromMap(map['location']),
    );
  }
}
