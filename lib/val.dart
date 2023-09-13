sealed class Val {}

final class VoidVal extends Val {}

final class IntVal extends Val {
  final int value;

  IntVal({required this.value});
}

final class StrVal extends Val {
  final String value;

  StrVal({required this.value});
}

final class BoolVal extends Val {
  final bool value;

  BoolVal({required this.value});
}
