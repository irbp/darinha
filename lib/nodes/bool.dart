import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Bool extends Term {
  Bool({
    required super.location,
    required this.value,
  });

  final BoolVal value;

  factory Bool.fromMap(Map<String, dynamic> map) {
    return Bool(
      location: Location.fromMap(map['location']),
      value: BoolVal(value: map['value']),
    );
  }

  @override
  Val eval(Map<String, Term> stack) {
    return value;
  }
}
