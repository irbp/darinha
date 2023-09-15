import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';
import 'package:rinha_de_compiler_dart/ast/val.dart';

final class StrNode extends Node {
  StrNode({
    required super.location,
    required this.value,
  });

  final StrVal value;

  factory StrNode.fromMap(Map<String, dynamic> map) {
    return StrNode(
      location: Location.fromMap(map['location']),
      value: StrVal(value: map['value']),
    );
  }
}
