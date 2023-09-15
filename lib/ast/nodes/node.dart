import 'package:rinha_de_compiler_dart/ast/nodes/binary_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/bool_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/if_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/int_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/let_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/location.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/parameter_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/print_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/str_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/var_node.dart';

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
      _ => throw AssertionError('Unrecognized node: $kind')
    };
  }
}
