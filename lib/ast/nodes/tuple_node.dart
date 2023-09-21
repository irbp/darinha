import 'location.dart';
import 'node.dart';

final class TupleNode extends Node {
  TupleNode({
    required this.first,
    required this.second,
    required super.location,
  });

  final Node first;
  final Node second;

  factory TupleNode.fromMap(Map<String, dynamic> map) {
    return TupleNode(
      first: Node.fromMap(map['first']),
      second: Node.fromMap(map['second']),
      location: Location.fromMap(map['location']),
    );
  }
}
