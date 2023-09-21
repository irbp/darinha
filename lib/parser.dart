import 'dart:convert';
import 'dart:io';

import 'ast/ast.dart';

class Parser {
  Parser({required String filePath}) : _filePath = filePath;

  final String _filePath;

  AST parse() {
    final file = File(_filePath);
    final fileContent = file.readAsStringSync();
    final jsonAst = jsonDecode(fileContent);
    return AST.fromMap(jsonAst);
  }
}
