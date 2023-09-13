import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/parameter.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Let extends Term {
  Let({
    required this.name,
    required this.value,
    required this.next,
    required super.location,
  });

  final Parameter name;
  final Term value;
  final Term next;

  factory Let.fromMap(Map<String, dynamic> map) {
    return Let(
      name: Parameter.fromMap(map['name']),
      value: Term.fromMap(map['value']),
      next: Term.fromMap(map['next']),
      location: Location.fromMap(map['location']),
    );
  }

  @override
  Val eval(Map<String, Term> stack) {
    stack[name.text] = value;
    return next.eval(stack);
  }
}
