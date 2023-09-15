import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';
import 'package:rinha_de_compiler_dart/ast/val.dart';

final class IntNode extends Node {
  IntNode({
    required super.location,
    required this.value,
  });

  final IntVal value;

  factory IntNode.fromMap(Map<String, dynamic> map) {
    return IntNode(
      location: Location.fromMap(map['location']),
      value: IntVal(value: map['value']),
    );
  }
}
