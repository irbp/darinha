import 'location.dart';
import 'node.dart';
import 'parameter_node.dart';

final class FunctionNode extends Node {
  FunctionNode({
    required this.parameters,
    required this.value,
    required super.location,
  });

  final List<ParameterNode> parameters;
  final Node value;

  factory FunctionNode.fromMap(Map<String, dynamic> map) {
    final parameters = map['parameters'] as List<dynamic>;
    return FunctionNode(
      parameters: parameters.map((e) => ParameterNode.fromMap(e)).toList(),
      value: Node.fromMap(map['value']),
      location: Location.fromMap(map['location']),
    );
  }
}
