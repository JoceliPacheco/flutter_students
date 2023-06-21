// ignore_for_file: overridden_fields

import '../../shared/constants/column_type.dart';
import '../interfaces/base_table.dart';

class StudentTable extends BaseTable {
  @override
  String tableName = 'aluno';

  @override
  Map<String, String> columns = {
    'id': ColumnType.typeText,
    'nome': ColumnType.typeText,
    'email': ColumnType.typeText,
    'senha': ColumnType.typeText,
    'situacao': ColumnType.typeInteger,
    'telefone': ColumnType.typeText,
    'valor_mensalidade': ColumnType.typeReal,
    'observacao': ColumnType.typeText,
  };

  @override
  List<String> primaryKey = ['id'];

  @override
  Map<String, dynamic> indexes = {};

  static final StudentTable instance = StudentTable._();
  factory StudentTable() => instance;
  StudentTable._();
}
