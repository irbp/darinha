sealed class Val {
  bool equals(Val other);
}

final class VoidVal extends Val {
  @override
  bool equals(Val other) => other is VoidVal;
}

final class IntVal extends Val {
  final int value;

  IntVal({required this.value});

  @override
  bool equals(Val other) => other is IntVal && other.value == value;
}

final class StrVal extends Val {
  final String value;

  StrVal({required this.value});

  @override
  bool equals(Val other) => other is StrVal && other.value == value;
}

final class BoolVal extends Val {
  final bool value;

  BoolVal({required this.value});

  @override
  bool equals(Val other) => other is BoolVal && other.value == value;
}
