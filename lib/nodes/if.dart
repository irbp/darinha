import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class If extends Term {
  final Term condition;
  final Term then;
  final Term otherwise;

  If({
    required this.condition,
    required this.then,
    required this.otherwise,
    required super.location,
  });

  factory If.fromMap(Map<String, dynamic> map) {
    return If(
      condition: Term.fromMap(map['condition']),
      then: Term.fromMap(map['then']),
      otherwise: Term.fromMap(map['otherwise']),
      location: Location.fromMap(map['location']),
    );
  }

  @override
  Val eval(Map<String, Term> stack) {
    final conditionEvalued = condition.eval(stack);
    if (conditionEvalued is! BoolVal) {
      throw AssertionError('Condition should be a boolean expression!');
    }
    if (conditionEvalued.value) {
      return then.eval(stack);
    } else {
      return otherwise.eval(stack);
    }
  }
}
