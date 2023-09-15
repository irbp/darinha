import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';

final class VarNode extends Node {
  VarNode({
    required this.text,
    required super.location,
  });

  final String text;

  factory VarNode.fromMap(Map<String, dynamic> map) {
    return VarNode(
      text: map['text'],
      location: Location.fromMap(map['location']),
    );
  }
}
