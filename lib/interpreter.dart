import 'dart:convert';
import 'dart:io';

import 'package:rinha_de_compiler_dart/ast.dart';

class Interpreter {
  final String _filePath;

  Interpreter({required String filePath}) : _filePath = filePath;

  void interpret() {
    final file = File(_filePath);
    final fileContent = file.readAsStringSync();
    final jsonAst = jsonDecode(fileContent);
    final ast = AST.fromMap(jsonAst);
    ast.eval();
  }
}
