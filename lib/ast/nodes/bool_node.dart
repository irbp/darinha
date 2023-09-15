import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';
import 'package:rinha_de_compiler_dart/ast/val.dart';

final class BoolNode extends Node {
  BoolNode({
    required super.location,
    required this.value,
  });

  final BoolVal value;

  factory BoolNode.fromMap(Map<String, dynamic> map) {
    return BoolNode(
      location: Location.fromMap(map['location']),
      value: BoolVal(value: map['value']),
    );
  }
}
