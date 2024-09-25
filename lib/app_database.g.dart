// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EmployeeTableTable extends EmployeeTable
    with TableInfo<$EmployeeTableTable, EmployeeDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'firstName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'lastName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [firstName, lastName, city];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee_table';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeeDto> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('firstName')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['firstName']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('lastName')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['lastName']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {firstName, lastName, city};
  @override
  EmployeeDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeDto(
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}firstName'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lastName'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
    );
  }

  @override
  $EmployeeTableTable createAlias(String alias) {
    return $EmployeeTableTable(attachedDatabase, alias);
  }
}

class EmployeeDto extends DataClass implements Insertable<EmployeeDto> {
  final String firstName;
  final String lastName;
  final String? city;
  const EmployeeDto(
      {required this.firstName, required this.lastName, this.city});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['firstName'] = Variable<String>(firstName);
    map['lastName'] = Variable<String>(lastName);
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    return map;
  }

  EmployeeTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeeTableCompanion(
      firstName: Value(firstName),
      lastName: Value(lastName),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
    );
  }

  factory EmployeeDto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeDto(
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      city: serializer.fromJson<String?>(json['city']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'city': serializer.toJson<String?>(city),
    };
  }

  EmployeeDto copyWith(
          {String? firstName,
          String? lastName,
          Value<String?> city = const Value.absent()}) =>
      EmployeeDto(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        city: city.present ? city.value : this.city,
      );
  EmployeeDto copyWithCompanion(EmployeeTableCompanion data) {
    return EmployeeDto(
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      city: data.city.present ? data.city.value : this.city,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeDto(')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('city: $city')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(firstName, lastName, city);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeDto &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.city == this.city);
}

class EmployeeTableCompanion extends UpdateCompanion<EmployeeDto> {
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> city;
  final Value<int> rowid;
  const EmployeeTableCompanion({
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.city = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmployeeTableCompanion.insert({
    required String firstName,
    required String lastName,
    this.city = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : firstName = Value(firstName),
        lastName = Value(lastName);
  static Insertable<EmployeeDto> custom({
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? city,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (city != null) 'city': city,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmployeeTableCompanion copyWith(
      {Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? city,
      Value<int>? rowid}) {
    return EmployeeTableCompanion(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      city: city ?? this.city,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firstName.present) {
      map['firstName'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['lastName'] = Variable<String>(lastName.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeTableCompanion(')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('city: $city, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EmployeeTableTable employeeTable = $EmployeeTableTable(this);
  late final EmployeeAccessor employeeAccessor =
      EmployeeAccessor(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [employeeTable];
}

typedef $$EmployeeTableTableCreateCompanionBuilder = EmployeeTableCompanion
    Function({
  required String firstName,
  required String lastName,
  Value<String?> city,
  Value<int> rowid,
});
typedef $$EmployeeTableTableUpdateCompanionBuilder = EmployeeTableCompanion
    Function({
  Value<String> firstName,
  Value<String> lastName,
  Value<String?> city,
  Value<int> rowid,
});

class $$EmployeeTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EmployeeTableTable> {
  $$EmployeeTableTableFilterComposer(super.$state);
  ColumnFilters<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get city => $state.composableBuilder(
      column: $state.table.city,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EmployeeTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EmployeeTableTable> {
  $$EmployeeTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get firstName => $state.composableBuilder(
      column: $state.table.firstName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastName => $state.composableBuilder(
      column: $state.table.lastName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get city => $state.composableBuilder(
      column: $state.table.city,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$EmployeeTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EmployeeTableTable,
    EmployeeDto,
    $$EmployeeTableTableFilterComposer,
    $$EmployeeTableTableOrderingComposer,
    $$EmployeeTableTableCreateCompanionBuilder,
    $$EmployeeTableTableUpdateCompanionBuilder,
    (
      EmployeeDto,
      BaseReferences<_$AppDatabase, $EmployeeTableTable, EmployeeDto>
    ),
    EmployeeDto,
    PrefetchHooks Function()> {
  $$EmployeeTableTableTableManager(_$AppDatabase db, $EmployeeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EmployeeTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EmployeeTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EmployeeTableCompanion(
            firstName: firstName,
            lastName: lastName,
            city: city,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String firstName,
            required String lastName,
            Value<String?> city = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EmployeeTableCompanion.insert(
            firstName: firstName,
            lastName: lastName,
            city: city,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EmployeeTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EmployeeTableTable,
    EmployeeDto,
    $$EmployeeTableTableFilterComposer,
    $$EmployeeTableTableOrderingComposer,
    $$EmployeeTableTableCreateCompanionBuilder,
    $$EmployeeTableTableUpdateCompanionBuilder,
    (
      EmployeeDto,
      BaseReferences<_$AppDatabase, $EmployeeTableTable, EmployeeDto>
    ),
    EmployeeDto,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EmployeeTableTableTableManager get employeeTable =>
      $$EmployeeTableTableTableManager(_db, _db.employeeTable);
}
