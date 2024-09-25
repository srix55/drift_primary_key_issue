import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'employee_accessor.dart';
import 'employee_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [EmployeeTable], daos: [EmployeeAccessor])
class AppDatabase extends _$AppDatabase {

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    // `driftDatabase` from `package:drift_flutter` stores the database in
    // `getApplicationDocumentsDirectory()`.
    return driftDatabase(name: 'my_database');
  }
}