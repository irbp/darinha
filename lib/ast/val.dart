import '../interpreter.dart';
import 'nodes/node.dart';
import 'nodes/parameter_node.dart';

sealed class Val {
  bool equals(Val other);

  @override
  String toString();
}

final class IntVal extends Val {
  IntVal({required this.value});

  final int value;

  @override
  bool equals(Val other) => other is IntVal && other.value == value;

  @override
  String toString() => '$value';
}

final class StrVal extends Val {
  StrVal({required this.value});

  final String value;

  @override
  bool equals(Val other) => other is StrVal && other.value == value;

  @override
  String toString() => value;
}

final class BoolVal extends Val {
  BoolVal({required this.value});

  final bool value;

  @override
  bool equals(Val other) => other is BoolVal && other.value == value;

  @override
  String toString() => '$value';
}

final class ClosureVal extends Val {
  ClosureVal({
    required this.body,
    required this.parameters,
    required this.stack,
  });

  final Node body;
  final List<ParameterNode> parameters;
  final Stack stack;

  @override
  bool equals(Val other) {
    return other is ClosureVal &&
        other.body == body &&
        other.parameters == parameters &&
        other.stack == stack;
  }

  @override
  String toString() => '<#closure>';
}

final class TupleVal extends Val {
  TupleVal({
    required this.first,
    required this.second,
  });

  final Val first;
  final Val second;

  @override
  bool equals(Val other) {
    return other is TupleVal && other.first == first && other.second == second;
  }

  @override
  String toString() => '($first, $second)';
}
