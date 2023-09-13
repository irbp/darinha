import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Str extends Term {
  Str({
    required super.location,
    required this.value,
  });

  final StrVal value;

  factory Str.fromMap(Map<String, dynamic> map) {
    return Str(
      location: Location.fromMap(map['location']),
      value: StrVal(value: map['value']),
    );
  }

  @override
  Val eval(Map<String, Term> stack) {
    return value;
  }
}
