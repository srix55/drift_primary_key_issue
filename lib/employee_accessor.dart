import 'package:drift/drift.dart';
import 'package:drift_primary_key_issue/app_database.dart';
import 'employee_table.dart';

part 'employee_accessor.g.dart';

@DriftAccessor(tables: [EmployeeTable])
class EmployeeAccessor extends DatabaseAccessor<AppDatabase> with _$EmployeeAccessorMixin {
  EmployeeAccessor(super.db);

  Future<EmployeeDto?> getEmployee({required String firstName, required String lastName, String? city}) {
    return (select(employeeTable)..where((tbl) => tbl.firstName.equals(firstName) & tbl.lastName.equals(lastName) & tbl.city.equalsNullable(city)))
        .getSingleOrNull();
  }

  Future<List<EmployeeDto>> getAllEmployees() {
    return (select(employeeTable)).get();
  }

  Future<void> saveEmployee({required String firstName, required String lastName, String? city}) async {
    await into(employeeTable).insert(EmployeeDto(firstName: firstName, lastName: lastName, city: city), mode: InsertMode.replace);
  }

  Future<void> deleteAllEmployees() async {
    await (delete(employeeTable)).go();
  }
}