import 'package:rinha_de_compiler_dart/nodes/int.dart';
import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/print.dart';
import 'package:rinha_de_compiler_dart/nodes/str.dart';
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
      'Str' => Str.fromMap(map),
      'Int' => Int.fromMap(map),
      _ => throw Exception()
    };
  }

  Val eval();
}
