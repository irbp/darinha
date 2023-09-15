import 'package:rinha_de_compiler_dart/ast/ast.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/binary_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/bool_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/if_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/int_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/let_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/parameter_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/print_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/str_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/var_node.dart';
import 'package:rinha_de_compiler_dart/ast/val.dart';
import 'package:rinha_de_compiler_dart/call_stack.dart';

class Interpreter {
  Interpreter({required AST ast}) : _ast = ast;

  final AST _ast;
  final Map<String, CallStack> _memory = {};

  void interpret() {
    _visitNode(_ast.program);
  }

  Val _visitNode(Node node) {
    return switch (node) {
      BoolNode() => _visitBoolNode(node),
      IntNode() => _visitIntNode(node),
      StrNode() => _visitStrNode(node),
      PrintNode() => _visitPrintNode(node),
      BinaryNode() => _visitBinaryNode(node),
      LetNode() => _visitLetNode(node),
      ParameterNode() => _visitParameterNode(node),
      VarNode() => _visitVarNode(node),
      IfNode() => _visitIfNode(node),
      _ => throw AssertionError(
          'file: ${node.location.filename}, '
          'position: ${node.location.start}: invalid node',
        )
    };
  }

  Val _visitBoolNode(BoolNode node) {
    return node.value;
  }

  Val _visitIntNode(IntNode node) {
    return node.value;
  }

  Val _visitStrNode(StrNode node) {
    return node.value;
  }

  Val _visitPrintNode(PrintNode node) {
    final val = _visitNode(node.value);
    switch (val) {
      case StrVal():
        print(val.value);
      case IntVal():
        print(val.value);
      case BoolVal():
        print(val.value);
      default:
        throw Exception('Error at: ${node.location.start}');
    }
    return VoidVal();
  }

  Val _visitBinaryNode(BinaryNode node) {
    final leftOperand = _visitNode(node.lhs);
    final rightOperand = _visitNode(node.rhs);
    final binaryOp = node.op;
    return binaryOp.operate(leftOperand, rightOperand);
  }

  Val _visitLetNode(LetNode node) {
    final callStack = _memory[node.name.text] ?? CallStack();
    final letValue = _visitNode(node.value);
    callStack.push(letValue);
    _memory[node.name.text] = callStack;
    final nextValue = _visitNode(node.next);
    callStack.pop();
    return nextValue;
  }

  Val _visitParameterNode(ParameterNode node) {
    return VoidVal();
  }

  Val _visitVarNode(VarNode node) {
    final value = _memory[node.text]?.peek();
    if (value == null) {
      throw AssertionError("Variable with name '${node.text}' not found!");
    }
    return value;
  }

  Val _visitIfNode(IfNode node) {
    final conditionEvalued = _visitNode(node.condition);
    if (conditionEvalued is! BoolVal) {
      throw AssertionError('Condition should be a boolean expression!');
    }
    if (conditionEvalued.value) {
      return _visitNode(node.then);
    } else {
      return _visitNode(node.otherwise);
    }
  }
}
