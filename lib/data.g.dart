// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $StudentTable extends Student with TableInfo<$StudentTable, StudentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subject];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student';
  @override
  VerificationContext validateIntegrity(Insertable<StudentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
    );
  }

  @override
  $StudentTable createAlias(String alias) {
    return $StudentTable(attachedDatabase, alias);
  }
}

class StudentData extends DataClass implements Insertable<StudentData> {
  final int id;
  final String name;
  final String subject;
  const StudentData(
      {required this.id, required this.name, required this.subject});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['subject'] = Variable<String>(subject);
    return map;
  }

  StudentCompanion toCompanion(bool nullToAbsent) {
    return StudentCompanion(
      id: Value(id),
      name: Value(name),
      subject: Value(subject),
    );
  }

  factory StudentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subject: serializer.fromJson<String>(json['subject']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subject': serializer.toJson<String>(subject),
    };
  }

  StudentData copyWith({int? id, String? name, String? subject}) => StudentData(
        id: id ?? this.id,
        name: name ?? this.name,
        subject: subject ?? this.subject,
      );
  StudentData copyWithCompanion(StudentCompanion data) {
    return StudentData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      subject: data.subject.present ? data.subject.value : this.subject,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subject: $subject')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subject);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentData &&
          other.id == this.id &&
          other.name == this.name &&
          other.subject == this.subject);
}

class StudentCompanion extends UpdateCompanion<StudentData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subject;
  const StudentCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subject = const Value.absent(),
  });
  StudentCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subject,
  })  : name = Value(name),
        subject = Value(subject);
  static Insertable<StudentData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subject,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subject != null) 'subject': subject,
    });
  }

  StudentCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? subject}) {
    return StudentCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subject: subject ?? this.subject,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subject: $subject')
          ..write(')'))
        .toString();
  }
}

class $MarksTable extends Marks with TableInfo<$MarksTable, Mark> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _englishmarksMeta =
      const VerificationMeta('englishmarks');
  @override
  late final GeneratedColumn<int> englishmarks = GeneratedColumn<int>(
      'englishmarks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _urdumarksMeta =
      const VerificationMeta('urdumarks');
  @override
  late final GeneratedColumn<int> urdumarks = GeneratedColumn<int>(
      'urdumarks', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, englishmarks, urdumarks];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'marks';
  @override
  VerificationContext validateIntegrity(Insertable<Mark> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('englishmarks')) {
      context.handle(
          _englishmarksMeta,
          englishmarks.isAcceptableOrUnknown(
              data['englishmarks']!, _englishmarksMeta));
    } else if (isInserting) {
      context.missing(_englishmarksMeta);
    }
    if (data.containsKey('urdumarks')) {
      context.handle(_urdumarksMeta,
          urdumarks.isAcceptableOrUnknown(data['urdumarks']!, _urdumarksMeta));
    } else if (isInserting) {
      context.missing(_urdumarksMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mark map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mark(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      englishmarks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}englishmarks'])!,
      urdumarks: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}urdumarks'])!,
    );
  }

  @override
  $MarksTable createAlias(String alias) {
    return $MarksTable(attachedDatabase, alias);
  }
}

class Mark extends DataClass implements Insertable<Mark> {
  final int id;
  final int englishmarks;
  final int urdumarks;
  const Mark(
      {required this.id, required this.englishmarks, required this.urdumarks});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['englishmarks'] = Variable<int>(englishmarks);
    map['urdumarks'] = Variable<int>(urdumarks);
    return map;
  }

  MarksCompanion toCompanion(bool nullToAbsent) {
    return MarksCompanion(
      id: Value(id),
      englishmarks: Value(englishmarks),
      urdumarks: Value(urdumarks),
    );
  }

  factory Mark.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mark(
      id: serializer.fromJson<int>(json['id']),
      englishmarks: serializer.fromJson<int>(json['englishmarks']),
      urdumarks: serializer.fromJson<int>(json['urdumarks']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'englishmarks': serializer.toJson<int>(englishmarks),
      'urdumarks': serializer.toJson<int>(urdumarks),
    };
  }

  Mark copyWith({int? id, int? englishmarks, int? urdumarks}) => Mark(
        id: id ?? this.id,
        englishmarks: englishmarks ?? this.englishmarks,
        urdumarks: urdumarks ?? this.urdumarks,
      );
  Mark copyWithCompanion(MarksCompanion data) {
    return Mark(
      id: data.id.present ? data.id.value : this.id,
      englishmarks: data.englishmarks.present
          ? data.englishmarks.value
          : this.englishmarks,
      urdumarks: data.urdumarks.present ? data.urdumarks.value : this.urdumarks,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mark(')
          ..write('id: $id, ')
          ..write('englishmarks: $englishmarks, ')
          ..write('urdumarks: $urdumarks')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, englishmarks, urdumarks);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mark &&
          other.id == this.id &&
          other.englishmarks == this.englishmarks &&
          other.urdumarks == this.urdumarks);
}

class MarksCompanion extends UpdateCompanion<Mark> {
  final Value<int> id;
  final Value<int> englishmarks;
  final Value<int> urdumarks;
  const MarksCompanion({
    this.id = const Value.absent(),
    this.englishmarks = const Value.absent(),
    this.urdumarks = const Value.absent(),
  });
  MarksCompanion.insert({
    this.id = const Value.absent(),
    required int englishmarks,
    required int urdumarks,
  })  : englishmarks = Value(englishmarks),
        urdumarks = Value(urdumarks);
  static Insertable<Mark> custom({
    Expression<int>? id,
    Expression<int>? englishmarks,
    Expression<int>? urdumarks,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (englishmarks != null) 'englishmarks': englishmarks,
      if (urdumarks != null) 'urdumarks': urdumarks,
    });
  }

  MarksCompanion copyWith(
      {Value<int>? id, Value<int>? englishmarks, Value<int>? urdumarks}) {
    return MarksCompanion(
      id: id ?? this.id,
      englishmarks: englishmarks ?? this.englishmarks,
      urdumarks: urdumarks ?? this.urdumarks,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (englishmarks.present) {
      map['englishmarks'] = Variable<int>(englishmarks.value);
    }
    if (urdumarks.present) {
      map['urdumarks'] = Variable<int>(urdumarks.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarksCompanion(')
          ..write('id: $id, ')
          ..write('englishmarks: $englishmarks, ')
          ..write('urdumarks: $urdumarks')
          ..write(')'))
        .toString();
  }
}

class StudentViewData extends DataClass {
  final String name;
  const StudentViewData({required this.name});
  factory StudentViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentViewData(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
    };
  }

  StudentViewData copyWith({String? name}) => StudentViewData(
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('StudentViewData(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentViewData && other.name == this.name);
}

class $StudentViewView extends ViewInfo<$StudentViewView, StudentViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $StudentViewView(this.attachedDatabase, [this._alias]);
  $StudentTable get student => attachedDatabase.student.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'student_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $StudentViewView get asDslTable => this;
  @override
  StudentViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentViewData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(student.name, false), type: DriftSqlType.string);
  @override
  $StudentViewView createAlias(String alias) {
    return $StudentViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(student)..addColumns($columns));
  @override
  Set<String> get readTables => const {'student'};
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $StudentTable student = $StudentTable(this);
  late final $MarksTable marks = $MarksTable(this);
  late final $StudentViewView studentView = $StudentViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [student, marks, studentView];
}

typedef $$StudentTableCreateCompanionBuilder = StudentCompanion Function({
  Value<int> id,
  required String name,
  required String subject,
});
typedef $$StudentTableUpdateCompanionBuilder = StudentCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> subject,
});

class $$StudentTableFilterComposer extends Composer<_$Database, $StudentTable> {
  $$StudentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));
}

class $$StudentTableOrderingComposer
    extends Composer<_$Database, $StudentTable> {
  $$StudentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));
}

class $$StudentTableAnnotationComposer
    extends Composer<_$Database, $StudentTable> {
  $$StudentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);
}

class $$StudentTableTableManager extends RootTableManager<
    _$Database,
    $StudentTable,
    StudentData,
    $$StudentTableFilterComposer,
    $$StudentTableOrderingComposer,
    $$StudentTableAnnotationComposer,
    $$StudentTableCreateCompanionBuilder,
    $$StudentTableUpdateCompanionBuilder,
    (StudentData, BaseReferences<_$Database, $StudentTable, StudentData>),
    StudentData,
    PrefetchHooks Function()> {
  $$StudentTableTableManager(_$Database db, $StudentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> subject = const Value.absent(),
          }) =>
              StudentCompanion(
            id: id,
            name: name,
            subject: subject,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String subject,
          }) =>
              StudentCompanion.insert(
            id: id,
            name: name,
            subject: subject,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudentTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $StudentTable,
    StudentData,
    $$StudentTableFilterComposer,
    $$StudentTableOrderingComposer,
    $$StudentTableAnnotationComposer,
    $$StudentTableCreateCompanionBuilder,
    $$StudentTableUpdateCompanionBuilder,
    (StudentData, BaseReferences<_$Database, $StudentTable, StudentData>),
    StudentData,
    PrefetchHooks Function()>;
typedef $$MarksTableCreateCompanionBuilder = MarksCompanion Function({
  Value<int> id,
  required int englishmarks,
  required int urdumarks,
});
typedef $$MarksTableUpdateCompanionBuilder = MarksCompanion Function({
  Value<int> id,
  Value<int> englishmarks,
  Value<int> urdumarks,
});

class $$MarksTableFilterComposer extends Composer<_$Database, $MarksTable> {
  $$MarksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get englishmarks => $composableBuilder(
      column: $table.englishmarks, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get urdumarks => $composableBuilder(
      column: $table.urdumarks, builder: (column) => ColumnFilters(column));
}

class $$MarksTableOrderingComposer extends Composer<_$Database, $MarksTable> {
  $$MarksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get englishmarks => $composableBuilder(
      column: $table.englishmarks,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get urdumarks => $composableBuilder(
      column: $table.urdumarks, builder: (column) => ColumnOrderings(column));
}

class $$MarksTableAnnotationComposer extends Composer<_$Database, $MarksTable> {
  $$MarksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get englishmarks => $composableBuilder(
      column: $table.englishmarks, builder: (column) => column);

  GeneratedColumn<int> get urdumarks =>
      $composableBuilder(column: $table.urdumarks, builder: (column) => column);
}

class $$MarksTableTableManager extends RootTableManager<
    _$Database,
    $MarksTable,
    Mark,
    $$MarksTableFilterComposer,
    $$MarksTableOrderingComposer,
    $$MarksTableAnnotationComposer,
    $$MarksTableCreateCompanionBuilder,
    $$MarksTableUpdateCompanionBuilder,
    (Mark, BaseReferences<_$Database, $MarksTable, Mark>),
    Mark,
    PrefetchHooks Function()> {
  $$MarksTableTableManager(_$Database db, $MarksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MarksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MarksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> englishmarks = const Value.absent(),
            Value<int> urdumarks = const Value.absent(),
          }) =>
              MarksCompanion(
            id: id,
            englishmarks: englishmarks,
            urdumarks: urdumarks,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int englishmarks,
            required int urdumarks,
          }) =>
              MarksCompanion.insert(
            id: id,
            englishmarks: englishmarks,
            urdumarks: urdumarks,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MarksTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $MarksTable,
    Mark,
    $$MarksTableFilterComposer,
    $$MarksTableOrderingComposer,
    $$MarksTableAnnotationComposer,
    $$MarksTableCreateCompanionBuilder,
    $$MarksTableUpdateCompanionBuilder,
    (Mark, BaseReferences<_$Database, $MarksTable, Mark>),
    Mark,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$StudentTableTableManager get student =>
      $$StudentTableTableManager(_db, _db.student);
  $$MarksTableTableManager get marks =>
      $$MarksTableTableManager(_db, _db.marks);
}
