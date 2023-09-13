import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

sealed class BinaryOp {
  factory BinaryOp.fromOpcode(String opcode) {
    return switch (opcode) {
      'Add' => Add(),
      'Sub' => Sub(),
      'Mul' => Mul(),
      'Div' => Div(),
      'Rem' => Rem(),
      'Eq' => Eq(),
      'Neq' => Neq(),
      'Lt' => Lt(),
      'Gt' => Gt(),
      'Lte' => Lte(),
      'Gte' => Gte(),
      'And' => And(),
      'Or' => Or(),
      _ => throw AssertionError('Invalid opcode: $opcode')
    };
  }

  Val eval(Term lhs, Term rhs, Map<String, Term> stack);
}

final class Add implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is StrVal && rhsVal is StrVal) {
      return StrVal(value: '${lhsVal.value}${rhsVal.value}');
    }
    if (lhsVal is StrVal && rhsVal is IntVal) {
      return StrVal(value: '${lhsVal.value}${rhsVal.value}');
    }
    if (lhsVal is IntVal && rhsVal is StrVal) {
      return StrVal(value: '${lhsVal.value}${rhsVal.value}');
    }
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return IntVal(value: lhsVal.value + rhsVal.value);
    }
    throw AssertionError('Incompatible types for Add');
  }
}

final class Sub implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return IntVal(value: lhsVal.value - rhsVal.value);
    }
    throw AssertionError('Incompatible types for Sub');
  }
}

final class Mul implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return IntVal(value: lhsVal.value * rhsVal.value);
    }
    throw AssertionError('Incompatible types for Mul');
  }
}

final class Div implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return IntVal(value: lhsVal.value ~/ rhsVal.value);
    }
    throw AssertionError('Incompatible types for Div');
  }
}

final class Rem implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return IntVal(value: lhsVal.value % rhsVal.value);
    }
    throw AssertionError('Incompatible types for Rem');
  }
}

final class Eq implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    return BoolVal(value: lhsVal.equals(rhsVal));
  }
}

final class Neq implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    return BoolVal(value: !lhsVal.equals(rhsVal));
  }
}

final class Lt implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return BoolVal(value: lhsVal.value < rhsVal.value);
    }
    throw AssertionError('Incompatible types for Lt');
  }
}

final class Gt implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return BoolVal(value: lhsVal.value > rhsVal.value);
    }
    throw AssertionError('Incompatible types for Gt');
  }
}

final class Lte implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return BoolVal(value: lhsVal.value <= rhsVal.value);
    }
    throw AssertionError('Incompatible types for Lte');
  }
}

final class Gte implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is IntVal && rhsVal is IntVal) {
      return BoolVal(value: lhsVal.value >= rhsVal.value);
    }
    throw AssertionError('Incompatible types for Gte');
  }
}

final class And implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is BoolVal && rhsVal is BoolVal) {
      return BoolVal(value: lhsVal.value && rhsVal.value);
    }
    throw AssertionError('Incompatible types for And');
  }
}

final class Or implements BinaryOp {
  @override
  Val eval(Term lhs, Term rhs, Map<String, Term> stack) {
    final lhsVal = lhs.eval(stack);
    final rhsVal = rhs.eval(stack);
    if (lhsVal is BoolVal && rhsVal is BoolVal) {
      return BoolVal(value: lhsVal.value || rhsVal.value);
    }
    throw AssertionError('Incompatible types for Or');
  }
}
