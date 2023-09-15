import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';

final class ParameterNode extends Node {
  ParameterNode({
    required this.text,
    required super.location,
  });

  final String text;

  factory ParameterNode.fromMap(Map<String, dynamic> map) {
    return ParameterNode(
      text: map['text'],
      location: Location.fromMap(map['location']),
    );
  }
}
