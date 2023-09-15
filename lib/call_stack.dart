import 'package:rinha_de_compiler_dart/ast/val.dart';

class CallStack {
  final List<Val> _values = [];

  void push(Val value) {
    _values.add(value);
  }

  Val pop() {
    return _values.removeLast();
  }

  Val peek() {
    return _values.last;
  }
}
