import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Parameter extends Term {
  Parameter({
    required this.text,
    required super.location,
  });

  final String text;

  factory Parameter.fromMap(Map<String, dynamic> map) {
    return Parameter(
      text: map['text'],
      location: Location.fromMap(map['location']),
    );
  }

  @override
  Val eval(Map<String, Term> stack) {
    return VoidVal();
  }
}
