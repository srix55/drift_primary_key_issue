import 'package:drift/drift.dart';

@DataClassName('EmployeeDto')
class EmployeeTable extends Table {
  TextColumn get firstName => text().named('firstName')();
  TextColumn get lastName => text().named('lastName')();
  TextColumn get city => text().named('city').nullable()();

  @override
  Set<Column> get primaryKey => {firstName, lastName, city};
}