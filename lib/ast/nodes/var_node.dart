import 'location.dart';
import 'node.dart';

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
