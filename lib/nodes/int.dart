import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Int extends Term {
  Int({
    required super.location,
    required this.value,
  });

  final IntVal value;

  factory Int.fromMap(Map<String, dynamic> map) {
    return Int(
      location: Location.fromMap(map['location']),
      value: IntVal(value: map['value']),
    );
  }

  @override
  Val eval() {
    return value;
  }
}
