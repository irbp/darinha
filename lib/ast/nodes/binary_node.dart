import 'binary_op.dart';
import 'location.dart';
import 'node.dart';

class BinaryNode extends Node {
  BinaryNode({
    required super.location,
    required this.lhs,
    required this.op,
    required this.rhs,
  });

  final Node lhs;
  final BinaryOp op;
  final Node rhs;

  factory BinaryNode.fromMap(Map<String, dynamic> map) {
    return BinaryNode(
      location: Location.fromMap(map['location']),
      lhs: Node.fromMap(map['lhs']),
      op: BinaryOp.fromOpcode(map['op']),
      rhs: Node.fromMap(map['rhs']),
    );
  }
}
