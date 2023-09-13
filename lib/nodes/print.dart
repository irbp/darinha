import 'package:rinha_de_compiler_dart/nodes/location.dart';
import 'package:rinha_de_compiler_dart/nodes/term.dart';
import 'package:rinha_de_compiler_dart/val.dart';

final class Print extends Term {
  Print({
    required super.location,
    required this.value,
  });

  final Term value;

  factory Print.fromMap(Map<String, dynamic> map) {
    return Print(
      location: Location.fromMap(map['location']),
      value: Term.fromMap(map['value']),
    );
  }

  @override
  Val eval() {
    final val = value.eval();
    switch (val) {
      case StrVal():
        print(val.value);
      case IntVal():
        print(val.value);
      case BoolVal():
        print(val.value);
      default:
        throw Exception('Error at: ${location.start}');
    }
    return VoidVal();
  }
}
