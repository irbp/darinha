import 'package:rinha_de_compiler_dart/interpreter.dart';

void main(List<String> arguments) {
  Interpreter(filePath: './resources/main.json').interpret();
}
