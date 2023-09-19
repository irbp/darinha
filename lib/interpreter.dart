import 'package:rinha_de_compiler_dart/ast/ast.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/binary_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/bool_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/call_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/first_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/function_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/if_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/int_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/let_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/print_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/second_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/str_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/tuple_node.dart';
import 'package:rinha_de_compiler_dart/ast/nodes/var_node.dart';
import 'package:rinha_de_compiler_dart/ast/val.dart';

typedef Memory = Map<String, Val>;

class Interpreter {
  Interpreter({required AST ast}) : _ast = ast;

  final AST _ast;
  final Memory _memory = {};

  void interpret() {
    _visitNode(_ast.program, _memory);
  }

  Val _visitNode(Node node, Memory memory) {
    return switch (node) {
      BoolNode() => _visitBoolNode(node, memory),
      IntNode() => _visitIntNode(node, memory),
      StrNode() => _visitStrNode(node, memory),
      PrintNode() => _visitPrintNode(node, memory),
      BinaryNode() => _visitBinaryNode(node, memory),
      LetNode() => _visitLetNode(node, memory),
      VarNode() => _visitVarNode(node, memory),
      IfNode() => _visitIfNode(node, memory),
      FunctionNode() => _visitFunctionNode(node, memory),
      CallNode() => _visitCallNode(node, memory),
      TupleNode() => _visitTupleNode(node, memory),
      FirstNode() => _visitFirstNode(node, memory),
      SecondNode() => _visitSecondNode(node, memory),
      _ => throw AssertionError(
          'file: ${node.location.filename}, '
          'position: ${node.location.start}: invalid node',
        )
    };
  }

  Val _visitBoolNode(BoolNode node, Memory memory) {
    return node.value;
  }

  Val _visitIntNode(IntNode node, Memory memory) {
    return node.value;
  }

  Val _visitStrNode(StrNode node, Memory memory) {
    return node.value;
  }

  Val _visitPrintNode(PrintNode node, Memory memory) {
    final val = _visitNode(node.value, memory);
    print(val);
    return val;
  }

  Val _visitBinaryNode(BinaryNode node, Memory memory) {
    final leftOperand = _visitNode(node.lhs, memory);
    final rightOperand = _visitNode(node.rhs, memory);
    final binaryOp = node.op;
    return binaryOp.operate(leftOperand, rightOperand);
  }

  Val _visitLetNode(LetNode node, Memory memory) {
    final letValue = _visitNode(node.value, memory);
    final scopeMemory = Memory.from(memory);
    scopeMemory[node.name.text] = letValue;
    return _visitNode(node.next, scopeMemory);
  }

  Val _visitVarNode(VarNode node, Memory memory) {
    final value = memory[node.text];
    if (value == null) {
      throw AssertionError("Variable with name '${node.text}' not found!");
    }
    return value;
  }

  Val _visitIfNode(IfNode node, Memory memory) {
    final conditionEvalued = _visitNode(node.condition, memory);
    if (conditionEvalued is! BoolVal) {
      throw AssertionError('Condition should be a boolean expression!');
    }
    if (conditionEvalued.value) {
      return _visitNode(node.then, memory);
    } else {
      return _visitNode(node.otherwise, memory);
    }
  }

  Val _visitFunctionNode(FunctionNode node, Memory memory) {
    return ClosureVal(
      body: node.value,
      parameters: node.parameters,
    );
  }

  Val _visitCallNode(CallNode node, Memory memory) {
    final callee = _visitNode(node.callee, memory);
    if (callee is! ClosureVal) {
      throw AssertionError('Invalid function!');
    }

    final parametersLength = callee.parameters.length;
    final argumentsLength = node.arguments.length;
    if (parametersLength != argumentsLength) {
      throw AssertionError(
        '$parametersLength arguments expected, but $argumentsLength found.',
      );
    }

    final scopeMemory = Memory.from(memory);
    for (int i = 0; i < parametersLength; i++) {
      final parameter = callee.parameters[i];
      final argument = node.arguments[i];
      final value = _visitNode(argument, memory);
      scopeMemory[parameter.text] = value;
    }

    return _visitNode(callee.body, scopeMemory);
  }

  Val _visitTupleNode(TupleNode node, Memory memory) {
    return TupleVal(
      first: _visitNode(node.first, memory),
      second: _visitNode(node.second, memory),
    );
  }

  Val _visitFirstNode(FirstNode node, Memory memory) {
    final visitedNode = _visitNode(node.value, memory);
    if (visitedNode is! TupleVal) {
      throw AssertionError('first() function should be called with a tuple!');
    }
    return visitedNode.first;
  }

  Val _visitSecondNode(SecondNode node, Memory memory) {
    final visitedNode = _visitNode(node.value, memory);
    if (visitedNode is! TupleVal) {
      throw AssertionError('second() function should be called with a tuple!');
    }
    return visitedNode.second;
  }
}
