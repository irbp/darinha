import 'ast/ast.dart';
import 'ast/nodes/binary_node.dart';
import 'ast/nodes/bool_node.dart';
import 'ast/nodes/call_node.dart';
import 'ast/nodes/first_node.dart';
import 'ast/nodes/function_node.dart';
import 'ast/nodes/if_node.dart';
import 'ast/nodes/int_node.dart';
import 'ast/nodes/let_node.dart';
import 'ast/nodes/node.dart';
import 'ast/nodes/print_node.dart';
import 'ast/nodes/second_node.dart';
import 'ast/nodes/str_node.dart';
import 'ast/nodes/tuple_node.dart';
import 'ast/nodes/var_node.dart';
import 'ast/val.dart';

typedef Stack = Map<String, Val>;

class Interpreter {
  Interpreter({required AST ast}) : _ast = ast;

  final AST _ast;
  final Stack _memory = {};

  void interpret() {
    _visitNode(_ast.program, _memory);
  }

  Val _visitNode(Node node, Stack stack) {
    return switch (node) {
      BoolNode() => _visitBoolNode(node, stack),
      IntNode() => _visitIntNode(node, stack),
      StrNode() => _visitStrNode(node, stack),
      PrintNode() => _visitPrintNode(node, stack),
      BinaryNode() => _visitBinaryNode(node, stack),
      LetNode() => _visitLetNode(node, stack),
      VarNode() => _visitVarNode(node, stack),
      IfNode() => _visitIfNode(node, stack),
      FunctionNode() => _visitFunctionNode(node, stack),
      CallNode() => _visitCallNode(node, stack),
      TupleNode() => _visitTupleNode(node, stack),
      FirstNode() => _visitFirstNode(node, stack),
      SecondNode() => _visitSecondNode(node, stack),
      _ => throw AssertionError(
          'file: ${node.location.filename}, '
          'position: ${node.location.start}: invalid node',
        )
    };
  }

  Val _visitBoolNode(BoolNode node, Stack stack) {
    return node.value;
  }

  Val _visitIntNode(IntNode node, Stack stack) {
    return node.value;
  }

  Val _visitStrNode(StrNode node, Stack stack) {
    return node.value;
  }

  Val _visitPrintNode(PrintNode node, Stack stack) {
    final val = _visitNode(node.value, stack);
    print(val);
    return val;
  }

  Val _visitBinaryNode(BinaryNode node, Stack stack) {
    final leftOperand = _visitNode(node.lhs, stack);
    final rightOperand = _visitNode(node.rhs, stack);
    final binaryOp = node.op;
    return binaryOp.operate(leftOperand, rightOperand);
  }

  Val _visitLetNode(LetNode node, Stack stack) {
    final letValue = _visitNode(node.value, stack);
    final scopeStack = Stack.from(stack);
    scopeStack[node.name.text] = letValue;
    return _visitNode(node.next, scopeStack);
  }

  Val _visitVarNode(VarNode node, Stack stack) {
    final value = stack[node.text];
    if (value == null) {
      throw AssertionError("Variable with name '${node.text}' not found!");
    }
    return value;
  }

  Val _visitIfNode(IfNode node, Stack stack) {
    final conditionEvalued = _visitNode(node.condition, stack);
    if (conditionEvalued is! BoolVal) {
      throw AssertionError('Condition should be a boolean expression!');
    }
    if (conditionEvalued.value) {
      return _visitNode(node.then, stack);
    } else {
      return _visitNode(node.otherwise, stack);
    }
  }

  Val _visitFunctionNode(FunctionNode node, Stack stack) {
    return ClosureVal(
      body: node.value,
      parameters: node.parameters,
      stack: stack,
    );
  }

  Val _visitCallNode(CallNode node, Stack stack) {
    final callee = _visitNode(node.callee, stack);
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

    final scopeStack = Stack.from(stack);
    scopeStack.addAll(callee.stack);
    for (int i = 0; i < parametersLength; i++) {
      final parameter = callee.parameters[i];
      final argument = node.arguments[i];
      final value = _visitNode(argument, stack);
      scopeStack[parameter.text] = value;
    }

    return _visitNode(callee.body, scopeStack);
  }

  Val _visitTupleNode(TupleNode node, Stack stack) {
    return TupleVal(
      first: _visitNode(node.first, stack),
      second: _visitNode(node.second, stack),
    );
  }

  Val _visitFirstNode(FirstNode node, Stack stack) {
    final visitedNode = _visitNode(node.value, stack);
    if (visitedNode is! TupleVal) {
      throw AssertionError('first() function should be called with a tuple!');
    }
    return visitedNode.first;
  }

  Val _visitSecondNode(SecondNode node, Stack stack) {
    final visitedNode = _visitNode(node.value, stack);
    if (visitedNode is! TupleVal) {
      throw AssertionError('second() function should be called with a tuple!');
    }
    return visitedNode.second;
  }
}
