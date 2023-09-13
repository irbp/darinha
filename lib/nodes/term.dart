import 'package:rinha_de_compiler_dart/nodes/binary.dart';
import 'package:rinha_de_compiler_dart/nodes/bool.dart';
import 'package:rinha_de_compiler_dart/nodes/int.dart';
import 'package:rinha_de_compiler_dart/nodes/let.dart';
import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/parameter.dart';
import 'package:rinha_de_compiler_dart/nodes/print.dart';
import 'package:rinha_de_compiler_dart/nodes/str.dart';
import 'package:rinha_de_compiler_dart/nodes/var.dart';
import 'package:rinha_de_compiler_dart/val.dart';

abstract class Term {
  final Location location;

  Term({
    required this.location,
  });

  factory Term.fromMap(Map<String, dynamic> map) {
    final kind = map['kind'];
    return switch (kind) {
      'Print' => Print.fromMap(map),
      'Binary' => Binary.fromMap(map),
      'Str' => Str.fromMap(map),
      'Int' => Int.fromMap(map),
      'Bool' => Bool.fromMap(map),
      'Let' => Let.fromMap(map),
      'Parameter' => Parameter.fromMap(map),
      'Var' => Var.fromMap(map),
      _ => throw AssertionError('Unrecognized node: $kind')
    };
  }

  Val eval(Map<String, Term> stack);
}
