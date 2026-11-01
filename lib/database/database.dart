import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class UsuarioTabela extends Table {
  TextColumn get idUsuario => text()();
  TextColumn get nomeUsuario => text()();
  TextColumn get sobrenomeUsuario => text()();
  BoolColumn get sincronizado => boolean()();

  @override
  Set<Column> get primaryKey => {idUsuario};
}

class UsuarioConversaTabela extends Table {
  TextColumn get idConversa => text().references(ConversaTabela, #idConversa)();
  TextColumn get idUsuario => text().references(UsuarioTabela, #idUsuario)();
  BoolColumn get sincronizado => boolean()();

  @override
  Set<Column> get primaryKey => {idConversa, idUsuario};
}

class MensagemTabela extends Table {
  TextColumn get idMensagem => text()();
  TextColumn get idConversa => text().references(ConversaTabela, #idConversa)();
  TextColumn get texto => text()();
  DateTimeColumn get horarioEnvio => dateTime()();
  BoolColumn get sincronizado => boolean()();

  @override
  Set<Column> get primaryKey => {idMensagem};
}

class ConversaTabela extends Table {
  TextColumn get idConversa => text()();
  BoolColumn get isGrupo => boolean()();
  BoolColumn get sincronizado => boolean()();

  @override
  Set<Column> get primaryKey => {idConversa};
}

@DriftDatabase(
  tables: [
    UsuarioTabela,
    UsuarioConversaTabela,
    ConversaTabela,
    MensagemTabela,
  ],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'ola_messenger_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
