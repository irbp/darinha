import 'binary_node.dart';
import 'bool_node.dart';
import 'call_node.dart';
import 'first_node.dart';
import 'function_node.dart';
import 'if_node.dart';
import 'int_node.dart';
import 'let_node.dart';
import 'location.dart';
import 'parameter_node.dart';
import 'print_node.dart';
import 'second_node.dart';
import 'str_node.dart';
import 'tuple_node.dart';
import 'var_node.dart';

abstract class Node {
  final Location location;

  Node({
    required this.location,
  });

  factory Node.fromMap(Map<String, dynamic> map) {
    final kind = map['kind'];
    return switch (kind) {
      'Print' => PrintNode.fromMap(map),
      'Binary' => BinaryNode.fromMap(map),
      'Str' => StrNode.fromMap(map),
      'Int' => IntNode.fromMap(map),
      'Bool' => BoolNode.fromMap(map),
      'Let' => LetNode.fromMap(map),
      'Parameter' => ParameterNode.fromMap(map),
      'Var' => VarNode.fromMap(map),
      'If' => IfNode.fromMap(map),
      'Function' => FunctionNode.fromMap(map),
      'Call' => CallNode.fromMap(map),
      'Tuple' => TupleNode.fromMap(map),
      'First' => FirstNode.fromMap(map),
      'Second' => SecondNode.fromMap(map),
      _ => throw AssertionError('Unrecognized node: $kind')
    };
  }
}
