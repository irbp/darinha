import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Var extends Term {
  Var({
    required this.text,
    required super.location,
  });

  final String text;

  factory Var.fromMap(Map<String, dynamic> map) {
    return Var(
      text: map['text'],
      location: Location.fromMap(map['location']),
    );
  }

  @override
  Val eval(Map<String, Term> stack) {
    final termInStack = stack[text];
    if (termInStack == null) {
      throw AssertionError("Variable with name 'text' not found!");
    }
    return termInStack.eval(stack);
  }
}
