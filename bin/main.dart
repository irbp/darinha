import 'package:rinha_de_compiler_dart/interpreter.dart';
import 'package:rinha_de_compiler_dart/parser.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    throw AssertionError('Filepath cannot be empty');
  }
  final filepath = arguments.first;
  final parser = Parser(filePath: filepath);
  final ast = parser.parse();
  final interpreter = Interpreter(ast: ast);
  interpreter.interpret();
}
