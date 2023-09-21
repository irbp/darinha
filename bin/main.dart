import 'package:darinha/interpreter.dart';
import 'package:darinha/parser.dart';

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
