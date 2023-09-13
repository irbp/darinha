import 'package:rinha_de_compiler_dart/nodes/binary_op.dart';
import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

class Binary extends Term {
  Binary({
    required super.location,
    required this.lhs,
    required this.op,
    required this.rhs,
  });

  final Term lhs;
  final BinaryOp op;
  final Term rhs;

  factory Binary.fromMap(Map<String, dynamic> map) {
    return Binary(
      location: Location.fromMap(map['location']),
      lhs: Term.fromMap(map['lhs']),
      op: BinaryOp.fromOpcode(map['op']),
      rhs: Term.fromMap(map['rhs']),
    );
  }

  @override
  Val eval() {
    return op.eval(lhs, rhs);
  }
}
