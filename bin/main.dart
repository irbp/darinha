import 'package:rinha_de_compiler_dart/interpreter.dart';
import 'package:rinha_de_compiler_dart/parser.dart';

void main(List<String> arguments) {
  final parser = Parser(filePath: './resources/main.json');
  final ast = parser.parse();
  final interpreter = Interpreter(ast: ast);
  interpreter.interpret();
}
