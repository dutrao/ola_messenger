// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsuarioTabelaTable extends UsuarioTabela
    with TableInfo<$UsuarioTabelaTable, UsuarioTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuarioTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idUsuarioMeta = const VerificationMeta(
    'idUsuario',
  );
  @override
  late final GeneratedColumn<String> idUsuario = GeneratedColumn<String>(
    'id_usuario',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomeUsuarioMeta = const VerificationMeta(
    'nomeUsuario',
  );
  @override
  late final GeneratedColumn<String> nomeUsuario = GeneratedColumn<String>(
    'nome_usuario',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sobrenomeUsuarioMeta = const VerificationMeta(
    'sobrenomeUsuario',
  );
  @override
  late final GeneratedColumn<String> sobrenomeUsuario = GeneratedColumn<String>(
    'sobrenome_usuario',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idUsuario,
    nomeUsuario,
    sobrenomeUsuario,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuario_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsuarioTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_usuario')) {
      context.handle(
        _idUsuarioMeta,
        idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta),
      );
    } else if (isInserting) {
      context.missing(_idUsuarioMeta);
    }
    if (data.containsKey('nome_usuario')) {
      context.handle(
        _nomeUsuarioMeta,
        nomeUsuario.isAcceptableOrUnknown(
          data['nome_usuario']!,
          _nomeUsuarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nomeUsuarioMeta);
    }
    if (data.containsKey('sobrenome_usuario')) {
      context.handle(
        _sobrenomeUsuarioMeta,
        sobrenomeUsuario.isAcceptableOrUnknown(
          data['sobrenome_usuario']!,
          _sobrenomeUsuarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sobrenomeUsuarioMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sincronizadoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUsuario};
  @override
  UsuarioTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsuarioTabelaData(
      idUsuario: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_usuario'],
      )!,
      nomeUsuario: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nome_usuario'],
      )!,
      sobrenomeUsuario: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sobrenome_usuario'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $UsuarioTabelaTable createAlias(String alias) {
    return $UsuarioTabelaTable(attachedDatabase, alias);
  }
}

class UsuarioTabelaData extends DataClass
    implements Insertable<UsuarioTabelaData> {
  final String idUsuario;
  final String nomeUsuario;
  final String sobrenomeUsuario;
  final bool sincronizado;
  const UsuarioTabelaData({
    required this.idUsuario,
    required this.nomeUsuario,
    required this.sobrenomeUsuario,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_usuario'] = Variable<String>(idUsuario);
    map['nome_usuario'] = Variable<String>(nomeUsuario);
    map['sobrenome_usuario'] = Variable<String>(sobrenomeUsuario);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  UsuarioTabelaCompanion toCompanion(bool nullToAbsent) {
    return UsuarioTabelaCompanion(
      idUsuario: Value(idUsuario),
      nomeUsuario: Value(nomeUsuario),
      sobrenomeUsuario: Value(sobrenomeUsuario),
      sincronizado: Value(sincronizado),
    );
  }

  factory UsuarioTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsuarioTabelaData(
      idUsuario: serializer.fromJson<String>(json['idUsuario']),
      nomeUsuario: serializer.fromJson<String>(json['nomeUsuario']),
      sobrenomeUsuario: serializer.fromJson<String>(json['sobrenomeUsuario']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUsuario': serializer.toJson<String>(idUsuario),
      'nomeUsuario': serializer.toJson<String>(nomeUsuario),
      'sobrenomeUsuario': serializer.toJson<String>(sobrenomeUsuario),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  UsuarioTabelaData copyWith({
    String? idUsuario,
    String? nomeUsuario,
    String? sobrenomeUsuario,
    bool? sincronizado,
  }) => UsuarioTabelaData(
    idUsuario: idUsuario ?? this.idUsuario,
    nomeUsuario: nomeUsuario ?? this.nomeUsuario,
    sobrenomeUsuario: sobrenomeUsuario ?? this.sobrenomeUsuario,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  UsuarioTabelaData copyWithCompanion(UsuarioTabelaCompanion data) {
    return UsuarioTabelaData(
      idUsuario: data.idUsuario.present ? data.idUsuario.value : this.idUsuario,
      nomeUsuario: data.nomeUsuario.present
          ? data.nomeUsuario.value
          : this.nomeUsuario,
      sobrenomeUsuario: data.sobrenomeUsuario.present
          ? data.sobrenomeUsuario.value
          : this.sobrenomeUsuario,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioTabelaData(')
          ..write('idUsuario: $idUsuario, ')
          ..write('nomeUsuario: $nomeUsuario, ')
          ..write('sobrenomeUsuario: $sobrenomeUsuario, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idUsuario, nomeUsuario, sobrenomeUsuario, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsuarioTabelaData &&
          other.idUsuario == this.idUsuario &&
          other.nomeUsuario == this.nomeUsuario &&
          other.sobrenomeUsuario == this.sobrenomeUsuario &&
          other.sincronizado == this.sincronizado);
}

class UsuarioTabelaCompanion extends UpdateCompanion<UsuarioTabelaData> {
  final Value<String> idUsuario;
  final Value<String> nomeUsuario;
  final Value<String> sobrenomeUsuario;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const UsuarioTabelaCompanion({
    this.idUsuario = const Value.absent(),
    this.nomeUsuario = const Value.absent(),
    this.sobrenomeUsuario = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsuarioTabelaCompanion.insert({
    required String idUsuario,
    required String nomeUsuario,
    required String sobrenomeUsuario,
    required bool sincronizado,
    this.rowid = const Value.absent(),
  }) : idUsuario = Value(idUsuario),
       nomeUsuario = Value(nomeUsuario),
       sobrenomeUsuario = Value(sobrenomeUsuario),
       sincronizado = Value(sincronizado);
  static Insertable<UsuarioTabelaData> custom({
    Expression<String>? idUsuario,
    Expression<String>? nomeUsuario,
    Expression<String>? sobrenomeUsuario,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idUsuario != null) 'id_usuario': idUsuario,
      if (nomeUsuario != null) 'nome_usuario': nomeUsuario,
      if (sobrenomeUsuario != null) 'sobrenome_usuario': sobrenomeUsuario,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsuarioTabelaCompanion copyWith({
    Value<String>? idUsuario,
    Value<String>? nomeUsuario,
    Value<String>? sobrenomeUsuario,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return UsuarioTabelaCompanion(
      idUsuario: idUsuario ?? this.idUsuario,
      nomeUsuario: nomeUsuario ?? this.nomeUsuario,
      sobrenomeUsuario: sobrenomeUsuario ?? this.sobrenomeUsuario,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUsuario.present) {
      map['id_usuario'] = Variable<String>(idUsuario.value);
    }
    if (nomeUsuario.present) {
      map['nome_usuario'] = Variable<String>(nomeUsuario.value);
    }
    if (sobrenomeUsuario.present) {
      map['sobrenome_usuario'] = Variable<String>(sobrenomeUsuario.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioTabelaCompanion(')
          ..write('idUsuario: $idUsuario, ')
          ..write('nomeUsuario: $nomeUsuario, ')
          ..write('sobrenomeUsuario: $sobrenomeUsuario, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConversaTabelaTable extends ConversaTabela
    with TableInfo<$ConversaTabelaTable, ConversaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idConversaMeta = const VerificationMeta(
    'idConversa',
  );
  @override
  late final GeneratedColumn<String> idConversa = GeneratedColumn<String>(
    'id_conversa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isGrupoMeta = const VerificationMeta(
    'isGrupo',
  );
  @override
  late final GeneratedColumn<bool> isGrupo = GeneratedColumn<bool>(
    'is_grupo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_grupo" IN (0, 1))',
    ),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idConversa, isGrupo, sincronizado];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversa_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConversaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_conversa')) {
      context.handle(
        _idConversaMeta,
        idConversa.isAcceptableOrUnknown(data['id_conversa']!, _idConversaMeta),
      );
    } else if (isInserting) {
      context.missing(_idConversaMeta);
    }
    if (data.containsKey('is_grupo')) {
      context.handle(
        _isGrupoMeta,
        isGrupo.isAcceptableOrUnknown(data['is_grupo']!, _isGrupoMeta),
      );
    } else if (isInserting) {
      context.missing(_isGrupoMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sincronizadoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idConversa};
  @override
  ConversaTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConversaTabelaData(
      idConversa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_conversa'],
      )!,
      isGrupo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_grupo'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $ConversaTabelaTable createAlias(String alias) {
    return $ConversaTabelaTable(attachedDatabase, alias);
  }
}

class ConversaTabelaData extends DataClass
    implements Insertable<ConversaTabelaData> {
  final String idConversa;
  final bool isGrupo;
  final bool sincronizado;
  const ConversaTabelaData({
    required this.idConversa,
    required this.isGrupo,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_conversa'] = Variable<String>(idConversa);
    map['is_grupo'] = Variable<bool>(isGrupo);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  ConversaTabelaCompanion toCompanion(bool nullToAbsent) {
    return ConversaTabelaCompanion(
      idConversa: Value(idConversa),
      isGrupo: Value(isGrupo),
      sincronizado: Value(sincronizado),
    );
  }

  factory ConversaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversaTabelaData(
      idConversa: serializer.fromJson<String>(json['idConversa']),
      isGrupo: serializer.fromJson<bool>(json['isGrupo']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idConversa': serializer.toJson<String>(idConversa),
      'isGrupo': serializer.toJson<bool>(isGrupo),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  ConversaTabelaData copyWith({
    String? idConversa,
    bool? isGrupo,
    bool? sincronizado,
  }) => ConversaTabelaData(
    idConversa: idConversa ?? this.idConversa,
    isGrupo: isGrupo ?? this.isGrupo,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  ConversaTabelaData copyWithCompanion(ConversaTabelaCompanion data) {
    return ConversaTabelaData(
      idConversa: data.idConversa.present
          ? data.idConversa.value
          : this.idConversa,
      isGrupo: data.isGrupo.present ? data.isGrupo.value : this.isGrupo,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConversaTabelaData(')
          ..write('idConversa: $idConversa, ')
          ..write('isGrupo: $isGrupo, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idConversa, isGrupo, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversaTabelaData &&
          other.idConversa == this.idConversa &&
          other.isGrupo == this.isGrupo &&
          other.sincronizado == this.sincronizado);
}

class ConversaTabelaCompanion extends UpdateCompanion<ConversaTabelaData> {
  final Value<String> idConversa;
  final Value<bool> isGrupo;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const ConversaTabelaCompanion({
    this.idConversa = const Value.absent(),
    this.isGrupo = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConversaTabelaCompanion.insert({
    required String idConversa,
    required bool isGrupo,
    required bool sincronizado,
    this.rowid = const Value.absent(),
  }) : idConversa = Value(idConversa),
       isGrupo = Value(isGrupo),
       sincronizado = Value(sincronizado);
  static Insertable<ConversaTabelaData> custom({
    Expression<String>? idConversa,
    Expression<bool>? isGrupo,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idConversa != null) 'id_conversa': idConversa,
      if (isGrupo != null) 'is_grupo': isGrupo,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConversaTabelaCompanion copyWith({
    Value<String>? idConversa,
    Value<bool>? isGrupo,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return ConversaTabelaCompanion(
      idConversa: idConversa ?? this.idConversa,
      isGrupo: isGrupo ?? this.isGrupo,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idConversa.present) {
      map['id_conversa'] = Variable<String>(idConversa.value);
    }
    if (isGrupo.present) {
      map['is_grupo'] = Variable<bool>(isGrupo.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversaTabelaCompanion(')
          ..write('idConversa: $idConversa, ')
          ..write('isGrupo: $isGrupo, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsuarioConversaTabelaTable extends UsuarioConversaTabela
    with TableInfo<$UsuarioConversaTabelaTable, UsuarioConversaTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuarioConversaTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idConversaMeta = const VerificationMeta(
    'idConversa',
  );
  @override
  late final GeneratedColumn<String> idConversa = GeneratedColumn<String>(
    'id_conversa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conversa_tabela (id_conversa)',
    ),
  );
  static const VerificationMeta _idUsuarioMeta = const VerificationMeta(
    'idUsuario',
  );
  @override
  late final GeneratedColumn<String> idUsuario = GeneratedColumn<String>(
    'id_usuario',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuario_tabela (id_usuario)',
    ),
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idConversa, idUsuario, sincronizado];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuario_conversa_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsuarioConversaTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_conversa')) {
      context.handle(
        _idConversaMeta,
        idConversa.isAcceptableOrUnknown(data['id_conversa']!, _idConversaMeta),
      );
    } else if (isInserting) {
      context.missing(_idConversaMeta);
    }
    if (data.containsKey('id_usuario')) {
      context.handle(
        _idUsuarioMeta,
        idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta),
      );
    } else if (isInserting) {
      context.missing(_idUsuarioMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sincronizadoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idConversa, idUsuario};
  @override
  UsuarioConversaTabelaData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsuarioConversaTabelaData(
      idConversa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_conversa'],
      )!,
      idUsuario: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_usuario'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $UsuarioConversaTabelaTable createAlias(String alias) {
    return $UsuarioConversaTabelaTable(attachedDatabase, alias);
  }
}

class UsuarioConversaTabelaData extends DataClass
    implements Insertable<UsuarioConversaTabelaData> {
  final String idConversa;
  final String idUsuario;
  final bool sincronizado;
  const UsuarioConversaTabelaData({
    required this.idConversa,
    required this.idUsuario,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_conversa'] = Variable<String>(idConversa);
    map['id_usuario'] = Variable<String>(idUsuario);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  UsuarioConversaTabelaCompanion toCompanion(bool nullToAbsent) {
    return UsuarioConversaTabelaCompanion(
      idConversa: Value(idConversa),
      idUsuario: Value(idUsuario),
      sincronizado: Value(sincronizado),
    );
  }

  factory UsuarioConversaTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsuarioConversaTabelaData(
      idConversa: serializer.fromJson<String>(json['idConversa']),
      idUsuario: serializer.fromJson<String>(json['idUsuario']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idConversa': serializer.toJson<String>(idConversa),
      'idUsuario': serializer.toJson<String>(idUsuario),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  UsuarioConversaTabelaData copyWith({
    String? idConversa,
    String? idUsuario,
    bool? sincronizado,
  }) => UsuarioConversaTabelaData(
    idConversa: idConversa ?? this.idConversa,
    idUsuario: idUsuario ?? this.idUsuario,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  UsuarioConversaTabelaData copyWithCompanion(
    UsuarioConversaTabelaCompanion data,
  ) {
    return UsuarioConversaTabelaData(
      idConversa: data.idConversa.present
          ? data.idConversa.value
          : this.idConversa,
      idUsuario: data.idUsuario.present ? data.idUsuario.value : this.idUsuario,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioConversaTabelaData(')
          ..write('idConversa: $idConversa, ')
          ..write('idUsuario: $idUsuario, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idConversa, idUsuario, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsuarioConversaTabelaData &&
          other.idConversa == this.idConversa &&
          other.idUsuario == this.idUsuario &&
          other.sincronizado == this.sincronizado);
}

class UsuarioConversaTabelaCompanion
    extends UpdateCompanion<UsuarioConversaTabelaData> {
  final Value<String> idConversa;
  final Value<String> idUsuario;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const UsuarioConversaTabelaCompanion({
    this.idConversa = const Value.absent(),
    this.idUsuario = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsuarioConversaTabelaCompanion.insert({
    required String idConversa,
    required String idUsuario,
    required bool sincronizado,
    this.rowid = const Value.absent(),
  }) : idConversa = Value(idConversa),
       idUsuario = Value(idUsuario),
       sincronizado = Value(sincronizado);
  static Insertable<UsuarioConversaTabelaData> custom({
    Expression<String>? idConversa,
    Expression<String>? idUsuario,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idConversa != null) 'id_conversa': idConversa,
      if (idUsuario != null) 'id_usuario': idUsuario,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsuarioConversaTabelaCompanion copyWith({
    Value<String>? idConversa,
    Value<String>? idUsuario,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return UsuarioConversaTabelaCompanion(
      idConversa: idConversa ?? this.idConversa,
      idUsuario: idUsuario ?? this.idUsuario,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idConversa.present) {
      map['id_conversa'] = Variable<String>(idConversa.value);
    }
    if (idUsuario.present) {
      map['id_usuario'] = Variable<String>(idUsuario.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioConversaTabelaCompanion(')
          ..write('idConversa: $idConversa, ')
          ..write('idUsuario: $idUsuario, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MensagemTabelaTable extends MensagemTabela
    with TableInfo<$MensagemTabelaTable, MensagemTabelaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MensagemTabelaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMensagemMeta = const VerificationMeta(
    'idMensagem',
  );
  @override
  late final GeneratedColumn<String> idMensagem = GeneratedColumn<String>(
    'id_mensagem',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idConversaMeta = const VerificationMeta(
    'idConversa',
  );
  @override
  late final GeneratedColumn<String> idConversa = GeneratedColumn<String>(
    'id_conversa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES conversa_tabela (id_conversa)',
    ),
  );
  static const VerificationMeta _textoMeta = const VerificationMeta('texto');
  @override
  late final GeneratedColumn<String> texto = GeneratedColumn<String>(
    'texto',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _horarioEnvioMeta = const VerificationMeta(
    'horarioEnvio',
  );
  @override
  late final GeneratedColumn<DateTime> horarioEnvio = GeneratedColumn<DateTime>(
    'horario_envio',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sincronizadoMeta = const VerificationMeta(
    'sincronizado',
  );
  @override
  late final GeneratedColumn<bool> sincronizado = GeneratedColumn<bool>(
    'sincronizado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sincronizado" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idMensagem,
    idConversa,
    texto,
    horarioEnvio,
    sincronizado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mensagem_tabela';
  @override
  VerificationContext validateIntegrity(
    Insertable<MensagemTabelaData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_mensagem')) {
      context.handle(
        _idMensagemMeta,
        idMensagem.isAcceptableOrUnknown(data['id_mensagem']!, _idMensagemMeta),
      );
    } else if (isInserting) {
      context.missing(_idMensagemMeta);
    }
    if (data.containsKey('id_conversa')) {
      context.handle(
        _idConversaMeta,
        idConversa.isAcceptableOrUnknown(data['id_conversa']!, _idConversaMeta),
      );
    } else if (isInserting) {
      context.missing(_idConversaMeta);
    }
    if (data.containsKey('texto')) {
      context.handle(
        _textoMeta,
        texto.isAcceptableOrUnknown(data['texto']!, _textoMeta),
      );
    } else if (isInserting) {
      context.missing(_textoMeta);
    }
    if (data.containsKey('horario_envio')) {
      context.handle(
        _horarioEnvioMeta,
        horarioEnvio.isAcceptableOrUnknown(
          data['horario_envio']!,
          _horarioEnvioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_horarioEnvioMeta);
    }
    if (data.containsKey('sincronizado')) {
      context.handle(
        _sincronizadoMeta,
        sincronizado.isAcceptableOrUnknown(
          data['sincronizado']!,
          _sincronizadoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sincronizadoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMensagem};
  @override
  MensagemTabelaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MensagemTabelaData(
      idMensagem: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_mensagem'],
      )!,
      idConversa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id_conversa'],
      )!,
      texto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}texto'],
      )!,
      horarioEnvio: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}horario_envio'],
      )!,
      sincronizado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sincronizado'],
      )!,
    );
  }

  @override
  $MensagemTabelaTable createAlias(String alias) {
    return $MensagemTabelaTable(attachedDatabase, alias);
  }
}

class MensagemTabelaData extends DataClass
    implements Insertable<MensagemTabelaData> {
  final String idMensagem;
  final String idConversa;
  final String texto;
  final DateTime horarioEnvio;
  final bool sincronizado;
  const MensagemTabelaData({
    required this.idMensagem,
    required this.idConversa,
    required this.texto,
    required this.horarioEnvio,
    required this.sincronizado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_mensagem'] = Variable<String>(idMensagem);
    map['id_conversa'] = Variable<String>(idConversa);
    map['texto'] = Variable<String>(texto);
    map['horario_envio'] = Variable<DateTime>(horarioEnvio);
    map['sincronizado'] = Variable<bool>(sincronizado);
    return map;
  }

  MensagemTabelaCompanion toCompanion(bool nullToAbsent) {
    return MensagemTabelaCompanion(
      idMensagem: Value(idMensagem),
      idConversa: Value(idConversa),
      texto: Value(texto),
      horarioEnvio: Value(horarioEnvio),
      sincronizado: Value(sincronizado),
    );
  }

  factory MensagemTabelaData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MensagemTabelaData(
      idMensagem: serializer.fromJson<String>(json['idMensagem']),
      idConversa: serializer.fromJson<String>(json['idConversa']),
      texto: serializer.fromJson<String>(json['texto']),
      horarioEnvio: serializer.fromJson<DateTime>(json['horarioEnvio']),
      sincronizado: serializer.fromJson<bool>(json['sincronizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMensagem': serializer.toJson<String>(idMensagem),
      'idConversa': serializer.toJson<String>(idConversa),
      'texto': serializer.toJson<String>(texto),
      'horarioEnvio': serializer.toJson<DateTime>(horarioEnvio),
      'sincronizado': serializer.toJson<bool>(sincronizado),
    };
  }

  MensagemTabelaData copyWith({
    String? idMensagem,
    String? idConversa,
    String? texto,
    DateTime? horarioEnvio,
    bool? sincronizado,
  }) => MensagemTabelaData(
    idMensagem: idMensagem ?? this.idMensagem,
    idConversa: idConversa ?? this.idConversa,
    texto: texto ?? this.texto,
    horarioEnvio: horarioEnvio ?? this.horarioEnvio,
    sincronizado: sincronizado ?? this.sincronizado,
  );
  MensagemTabelaData copyWithCompanion(MensagemTabelaCompanion data) {
    return MensagemTabelaData(
      idMensagem: data.idMensagem.present
          ? data.idMensagem.value
          : this.idMensagem,
      idConversa: data.idConversa.present
          ? data.idConversa.value
          : this.idConversa,
      texto: data.texto.present ? data.texto.value : this.texto,
      horarioEnvio: data.horarioEnvio.present
          ? data.horarioEnvio.value
          : this.horarioEnvio,
      sincronizado: data.sincronizado.present
          ? data.sincronizado.value
          : this.sincronizado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MensagemTabelaData(')
          ..write('idMensagem: $idMensagem, ')
          ..write('idConversa: $idConversa, ')
          ..write('texto: $texto, ')
          ..write('horarioEnvio: $horarioEnvio, ')
          ..write('sincronizado: $sincronizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idMensagem, idConversa, texto, horarioEnvio, sincronizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MensagemTabelaData &&
          other.idMensagem == this.idMensagem &&
          other.idConversa == this.idConversa &&
          other.texto == this.texto &&
          other.horarioEnvio == this.horarioEnvio &&
          other.sincronizado == this.sincronizado);
}

class MensagemTabelaCompanion extends UpdateCompanion<MensagemTabelaData> {
  final Value<String> idMensagem;
  final Value<String> idConversa;
  final Value<String> texto;
  final Value<DateTime> horarioEnvio;
  final Value<bool> sincronizado;
  final Value<int> rowid;
  const MensagemTabelaCompanion({
    this.idMensagem = const Value.absent(),
    this.idConversa = const Value.absent(),
    this.texto = const Value.absent(),
    this.horarioEnvio = const Value.absent(),
    this.sincronizado = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MensagemTabelaCompanion.insert({
    required String idMensagem,
    required String idConversa,
    required String texto,
    required DateTime horarioEnvio,
    required bool sincronizado,
    this.rowid = const Value.absent(),
  }) : idMensagem = Value(idMensagem),
       idConversa = Value(idConversa),
       texto = Value(texto),
       horarioEnvio = Value(horarioEnvio),
       sincronizado = Value(sincronizado);
  static Insertable<MensagemTabelaData> custom({
    Expression<String>? idMensagem,
    Expression<String>? idConversa,
    Expression<String>? texto,
    Expression<DateTime>? horarioEnvio,
    Expression<bool>? sincronizado,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idMensagem != null) 'id_mensagem': idMensagem,
      if (idConversa != null) 'id_conversa': idConversa,
      if (texto != null) 'texto': texto,
      if (horarioEnvio != null) 'horario_envio': horarioEnvio,
      if (sincronizado != null) 'sincronizado': sincronizado,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MensagemTabelaCompanion copyWith({
    Value<String>? idMensagem,
    Value<String>? idConversa,
    Value<String>? texto,
    Value<DateTime>? horarioEnvio,
    Value<bool>? sincronizado,
    Value<int>? rowid,
  }) {
    return MensagemTabelaCompanion(
      idMensagem: idMensagem ?? this.idMensagem,
      idConversa: idConversa ?? this.idConversa,
      texto: texto ?? this.texto,
      horarioEnvio: horarioEnvio ?? this.horarioEnvio,
      sincronizado: sincronizado ?? this.sincronizado,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMensagem.present) {
      map['id_mensagem'] = Variable<String>(idMensagem.value);
    }
    if (idConversa.present) {
      map['id_conversa'] = Variable<String>(idConversa.value);
    }
    if (texto.present) {
      map['texto'] = Variable<String>(texto.value);
    }
    if (horarioEnvio.present) {
      map['horario_envio'] = Variable<DateTime>(horarioEnvio.value);
    }
    if (sincronizado.present) {
      map['sincronizado'] = Variable<bool>(sincronizado.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MensagemTabelaCompanion(')
          ..write('idMensagem: $idMensagem, ')
          ..write('idConversa: $idConversa, ')
          ..write('texto: $texto, ')
          ..write('horarioEnvio: $horarioEnvio, ')
          ..write('sincronizado: $sincronizado, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsuarioTabelaTable usuarioTabela = $UsuarioTabelaTable(this);
  late final $ConversaTabelaTable conversaTabela = $ConversaTabelaTable(this);
  late final $UsuarioConversaTabelaTable usuarioConversaTabela =
      $UsuarioConversaTabelaTable(this);
  late final $MensagemTabelaTable mensagemTabela = $MensagemTabelaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usuarioTabela,
    conversaTabela,
    usuarioConversaTabela,
    mensagemTabela,
  ];
}

typedef $$UsuarioTabelaTableCreateCompanionBuilder =
    UsuarioTabelaCompanion Function({
      required String idUsuario,
      required String nomeUsuario,
      required String sobrenomeUsuario,
      required bool sincronizado,
      Value<int> rowid,
    });
typedef $$UsuarioTabelaTableUpdateCompanionBuilder =
    UsuarioTabelaCompanion Function({
      Value<String> idUsuario,
      Value<String> nomeUsuario,
      Value<String> sobrenomeUsuario,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$UsuarioTabelaTableReferences
    extends
        BaseReferences<_$AppDatabase, $UsuarioTabelaTable, UsuarioTabelaData> {
  $$UsuarioTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $UsuarioConversaTabelaTable,
    List<UsuarioConversaTabelaData>
  >
  _usuarioConversaTabelaRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.usuarioConversaTabela,
        aliasName:
            'usuario_tabela__id_usuario__usuario_conversa_tabela__id_usuario',
      );

  $$UsuarioConversaTabelaTableProcessedTableManager
  get usuarioConversaTabelaRefs {
    final manager =
        $$UsuarioConversaTabelaTableTableManager(
          $_db,
          $_db.usuarioConversaTabela,
        ).filter(
          (f) => f.idUsuario.idUsuario.sqlEquals(
            $_itemColumn<String>('id_usuario')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _usuarioConversaTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsuarioTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $UsuarioTabelaTable> {
  $$UsuarioTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idUsuario => $composableBuilder(
    column: $table.idUsuario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nomeUsuario => $composableBuilder(
    column: $table.nomeUsuario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sobrenomeUsuario => $composableBuilder(
    column: $table.sobrenomeUsuario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usuarioConversaTabelaRefs(
    Expression<bool> Function($$UsuarioConversaTabelaTableFilterComposer f) f,
  ) {
    final $$UsuarioConversaTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idUsuario,
          referencedTable: $db.usuarioConversaTabela,
          getReferencedColumn: (t) => t.idUsuario,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UsuarioConversaTabelaTableFilterComposer(
                $db: $db,
                $table: $db.usuarioConversaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsuarioTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuarioTabelaTable> {
  $$UsuarioTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idUsuario => $composableBuilder(
    column: $table.idUsuario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nomeUsuario => $composableBuilder(
    column: $table.nomeUsuario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sobrenomeUsuario => $composableBuilder(
    column: $table.sobrenomeUsuario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsuarioTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuarioTabelaTable> {
  $$UsuarioTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idUsuario =>
      $composableBuilder(column: $table.idUsuario, builder: (column) => column);

  GeneratedColumn<String> get nomeUsuario => $composableBuilder(
    column: $table.nomeUsuario,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sobrenomeUsuario => $composableBuilder(
    column: $table.sobrenomeUsuario,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> usuarioConversaTabelaRefs<T extends Object>(
    Expression<T> Function($$UsuarioConversaTabelaTableAnnotationComposer a) f,
  ) {
    final $$UsuarioConversaTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idUsuario,
          referencedTable: $db.usuarioConversaTabela,
          getReferencedColumn: (t) => t.idUsuario,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UsuarioConversaTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.usuarioConversaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$UsuarioTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuarioTabelaTable,
          UsuarioTabelaData,
          $$UsuarioTabelaTableFilterComposer,
          $$UsuarioTabelaTableOrderingComposer,
          $$UsuarioTabelaTableAnnotationComposer,
          $$UsuarioTabelaTableCreateCompanionBuilder,
          $$UsuarioTabelaTableUpdateCompanionBuilder,
          (UsuarioTabelaData, $$UsuarioTabelaTableReferences),
          UsuarioTabelaData,
          PrefetchHooks Function({bool usuarioConversaTabelaRefs})
        > {
  $$UsuarioTabelaTableTableManager(_$AppDatabase db, $UsuarioTabelaTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuarioTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuarioTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuarioTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idUsuario = const Value.absent(),
                Value<String> nomeUsuario = const Value.absent(),
                Value<String> sobrenomeUsuario = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsuarioTabelaCompanion(
                idUsuario: idUsuario,
                nomeUsuario: nomeUsuario,
                sobrenomeUsuario: sobrenomeUsuario,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idUsuario,
                required String nomeUsuario,
                required String sobrenomeUsuario,
                required bool sincronizado,
                Value<int> rowid = const Value.absent(),
              }) => UsuarioTabelaCompanion.insert(
                idUsuario: idUsuario,
                nomeUsuario: nomeUsuario,
                sobrenomeUsuario: sobrenomeUsuario,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$UsuarioTabelaTable, UsuarioTabelaData>(table),
                  $$UsuarioTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioConversaTabelaRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (usuarioConversaTabelaRefs) db.usuarioConversaTabela,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usuarioConversaTabelaRefs)
                    await $_getPrefetchedDataByColumns<
                      UsuarioTabelaData,
                      $UsuarioTabelaTable,
                      UsuarioConversaTabelaData,
                      $UsuarioConversaTabelaTable
                    >(
                      currentTable: table,
                      referencedTable: $$UsuarioTabelaTableReferences
                          ._usuarioConversaTabelaRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsuarioTabelaTableReferences(
                            db,
                            table,
                            p0,
                          ).usuarioConversaTabelaRefs,
                      currentColumn: 'id_usuario',
                      referencedColumn: 'id_usuario',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsuarioTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuarioTabelaTable,
      UsuarioTabelaData,
      $$UsuarioTabelaTableFilterComposer,
      $$UsuarioTabelaTableOrderingComposer,
      $$UsuarioTabelaTableAnnotationComposer,
      $$UsuarioTabelaTableCreateCompanionBuilder,
      $$UsuarioTabelaTableUpdateCompanionBuilder,
      (UsuarioTabelaData, $$UsuarioTabelaTableReferences),
      UsuarioTabelaData,
      PrefetchHooks Function({bool usuarioConversaTabelaRefs})
    >;
typedef $$ConversaTabelaTableCreateCompanionBuilder =
    ConversaTabelaCompanion Function({
      required String idConversa,
      required bool isGrupo,
      required bool sincronizado,
      Value<int> rowid,
    });
typedef $$ConversaTabelaTableUpdateCompanionBuilder =
    ConversaTabelaCompanion Function({
      Value<String> idConversa,
      Value<bool> isGrupo,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$ConversaTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ConversaTabelaTable,
          ConversaTabelaData
        > {
  $$ConversaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $UsuarioConversaTabelaTable,
    List<UsuarioConversaTabelaData>
  >
  _usuarioConversaTabelaRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.usuarioConversaTabela,
    aliasName:
        'conversa_tabela__id_conversa__usuario_conversa_tabela__id_conversa',
  );

  $$UsuarioConversaTabelaTableProcessedTableManager
  get usuarioConversaTabelaRefs {
    final manager =
        $$UsuarioConversaTabelaTableTableManager(
          $_db,
          $_db.usuarioConversaTabela,
        ).filter(
          (f) => f.idConversa.idConversa.sqlEquals(
            $_itemColumn<String>('id_conversa')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(
      _usuarioConversaTabelaRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MensagemTabelaTable, List<MensagemTabelaData>>
  _mensagemTabelaRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mensagemTabela,
    aliasName: 'conversa_tabela__id_conversa__mensagem_tabela__id_conversa',
  );

  $$MensagemTabelaTableProcessedTableManager get mensagemTabelaRefs {
    final manager = $$MensagemTabelaTableTableManager($_db, $_db.mensagemTabela)
        .filter(
          (f) => f.idConversa.idConversa.sqlEquals(
            $_itemColumn<String>('id_conversa')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_mensagemTabelaRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConversaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $ConversaTabelaTable> {
  $$ConversaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idConversa => $composableBuilder(
    column: $table.idConversa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isGrupo => $composableBuilder(
    column: $table.isGrupo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usuarioConversaTabelaRefs(
    Expression<bool> Function($$UsuarioConversaTabelaTableFilterComposer f) f,
  ) {
    final $$UsuarioConversaTabelaTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idConversa,
          referencedTable: $db.usuarioConversaTabela,
          getReferencedColumn: (t) => t.idConversa,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UsuarioConversaTabelaTableFilterComposer(
                $db: $db,
                $table: $db.usuarioConversaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> mensagemTabelaRefs(
    Expression<bool> Function($$MensagemTabelaTableFilterComposer f) f,
  ) {
    final $$MensagemTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.mensagemTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MensagemTabelaTableFilterComposer(
            $db: $db,
            $table: $db.mensagemTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConversaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $ConversaTabelaTable> {
  $$ConversaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idConversa => $composableBuilder(
    column: $table.idConversa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isGrupo => $composableBuilder(
    column: $table.isGrupo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConversaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConversaTabelaTable> {
  $$ConversaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idConversa => $composableBuilder(
    column: $table.idConversa,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isGrupo =>
      $composableBuilder(column: $table.isGrupo, builder: (column) => column);

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  Expression<T> usuarioConversaTabelaRefs<T extends Object>(
    Expression<T> Function($$UsuarioConversaTabelaTableAnnotationComposer a) f,
  ) {
    final $$UsuarioConversaTabelaTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idConversa,
          referencedTable: $db.usuarioConversaTabela,
          getReferencedColumn: (t) => t.idConversa,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$UsuarioConversaTabelaTableAnnotationComposer(
                $db: $db,
                $table: $db.usuarioConversaTabela,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> mensagemTabelaRefs<T extends Object>(
    Expression<T> Function($$MensagemTabelaTableAnnotationComposer a) f,
  ) {
    final $$MensagemTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.mensagemTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MensagemTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.mensagemTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConversaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConversaTabelaTable,
          ConversaTabelaData,
          $$ConversaTabelaTableFilterComposer,
          $$ConversaTabelaTableOrderingComposer,
          $$ConversaTabelaTableAnnotationComposer,
          $$ConversaTabelaTableCreateCompanionBuilder,
          $$ConversaTabelaTableUpdateCompanionBuilder,
          (ConversaTabelaData, $$ConversaTabelaTableReferences),
          ConversaTabelaData,
          PrefetchHooks Function({
            bool usuarioConversaTabelaRefs,
            bool mensagemTabelaRefs,
          })
        > {
  $$ConversaTabelaTableTableManager(
    _$AppDatabase db,
    $ConversaTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversaTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConversaTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConversaTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idConversa = const Value.absent(),
                Value<bool> isGrupo = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ConversaTabelaCompanion(
                idConversa: idConversa,
                isGrupo: isGrupo,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idConversa,
                required bool isGrupo,
                required bool sincronizado,
                Value<int> rowid = const Value.absent(),
              }) => ConversaTabelaCompanion.insert(
                idConversa: idConversa,
                isGrupo: isGrupo,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ConversaTabelaTable, ConversaTabelaData>(table),
                  $$ConversaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                usuarioConversaTabelaRefs = false,
                mensagemTabelaRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (usuarioConversaTabelaRefs) db.usuarioConversaTabela,
                    if (mensagemTabelaRefs) db.mensagemTabela,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (usuarioConversaTabelaRefs)
                        await $_getPrefetchedDataByColumns<
                          ConversaTabelaData,
                          $ConversaTabelaTable,
                          UsuarioConversaTabelaData,
                          $UsuarioConversaTabelaTable
                        >(
                          currentTable: table,
                          referencedTable: $$ConversaTabelaTableReferences
                              ._usuarioConversaTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConversaTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).usuarioConversaTabelaRefs,
                          currentColumn: 'id_conversa',
                          referencedColumn: 'id_conversa',
                          typedResults: items,
                        ),
                      if (mensagemTabelaRefs)
                        await $_getPrefetchedDataByColumns<
                          ConversaTabelaData,
                          $ConversaTabelaTable,
                          MensagemTabelaData,
                          $MensagemTabelaTable
                        >(
                          currentTable: table,
                          referencedTable: $$ConversaTabelaTableReferences
                              ._mensagemTabelaRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConversaTabelaTableReferences(
                                db,
                                table,
                                p0,
                              ).mensagemTabelaRefs,
                          currentColumn: 'id_conversa',
                          referencedColumn: 'id_conversa',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ConversaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConversaTabelaTable,
      ConversaTabelaData,
      $$ConversaTabelaTableFilterComposer,
      $$ConversaTabelaTableOrderingComposer,
      $$ConversaTabelaTableAnnotationComposer,
      $$ConversaTabelaTableCreateCompanionBuilder,
      $$ConversaTabelaTableUpdateCompanionBuilder,
      (ConversaTabelaData, $$ConversaTabelaTableReferences),
      ConversaTabelaData,
      PrefetchHooks Function({
        bool usuarioConversaTabelaRefs,
        bool mensagemTabelaRefs,
      })
    >;
typedef $$UsuarioConversaTabelaTableCreateCompanionBuilder =
    UsuarioConversaTabelaCompanion Function({
      required String idConversa,
      required String idUsuario,
      required bool sincronizado,
      Value<int> rowid,
    });
typedef $$UsuarioConversaTabelaTableUpdateCompanionBuilder =
    UsuarioConversaTabelaCompanion Function({
      Value<String> idConversa,
      Value<String> idUsuario,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$UsuarioConversaTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $UsuarioConversaTabelaTable,
          UsuarioConversaTabelaData
        > {
  $$UsuarioConversaTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ConversaTabelaTable _idConversaTable(_$AppDatabase db) =>
      db.conversaTabela.createAlias(
        'usuario_conversa_tabela__id_conversa__conversa_tabela__id_conversa',
      );

  $$ConversaTabelaTableProcessedTableManager get idConversa {
    final $_column = $_itemColumn<String>('id_conversa')!;

    final manager = $$ConversaTabelaTableTableManager(
      $_db,
      $_db.conversaTabela,
    ).filter((f) => f.idConversa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idConversaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsuarioTabelaTable _idUsuarioTable(_$AppDatabase db) =>
      db.usuarioTabela.createAlias(
        'usuario_conversa_tabela__id_usuario__usuario_tabela__id_usuario',
      );

  $$UsuarioTabelaTableProcessedTableManager get idUsuario {
    final $_column = $_itemColumn<String>('id_usuario')!;

    final manager = $$UsuarioTabelaTableTableManager(
      $_db,
      $_db.usuarioTabela,
    ).filter((f) => f.idUsuario.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idUsuarioTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UsuarioConversaTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $UsuarioConversaTabelaTable> {
  $$UsuarioConversaTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$ConversaTabelaTableFilterComposer get idConversa {
    final $$ConversaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.conversaTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.conversaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuarioTabelaTableFilterComposer get idUsuario {
    final $$UsuarioTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUsuario,
      referencedTable: $db.usuarioTabela,
      getReferencedColumn: (t) => t.idUsuario,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioTabelaTableFilterComposer(
            $db: $db,
            $table: $db.usuarioTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsuarioConversaTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuarioConversaTabelaTable> {
  $$UsuarioConversaTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$ConversaTabelaTableOrderingComposer get idConversa {
    final $$ConversaTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.conversaTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversaTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.conversaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuarioTabelaTableOrderingComposer get idUsuario {
    final $$UsuarioTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUsuario,
      referencedTable: $db.usuarioTabela,
      getReferencedColumn: (t) => t.idUsuario,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.usuarioTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsuarioConversaTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuarioConversaTabelaTable> {
  $$UsuarioConversaTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$ConversaTabelaTableAnnotationComposer get idConversa {
    final $$ConversaTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.conversaTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversaTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.conversaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuarioTabelaTableAnnotationComposer get idUsuario {
    final $$UsuarioTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idUsuario,
      referencedTable: $db.usuarioTabela,
      getReferencedColumn: (t) => t.idUsuario,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarioTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsuarioConversaTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuarioConversaTabelaTable,
          UsuarioConversaTabelaData,
          $$UsuarioConversaTabelaTableFilterComposer,
          $$UsuarioConversaTabelaTableOrderingComposer,
          $$UsuarioConversaTabelaTableAnnotationComposer,
          $$UsuarioConversaTabelaTableCreateCompanionBuilder,
          $$UsuarioConversaTabelaTableUpdateCompanionBuilder,
          (UsuarioConversaTabelaData, $$UsuarioConversaTabelaTableReferences),
          UsuarioConversaTabelaData,
          PrefetchHooks Function({bool idConversa, bool idUsuario})
        > {
  $$UsuarioConversaTabelaTableTableManager(
    _$AppDatabase db,
    $UsuarioConversaTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuarioConversaTabelaTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$UsuarioConversaTabelaTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$UsuarioConversaTabelaTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> idConversa = const Value.absent(),
                Value<String> idUsuario = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsuarioConversaTabelaCompanion(
                idConversa: idConversa,
                idUsuario: idUsuario,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idConversa,
                required String idUsuario,
                required bool sincronizado,
                Value<int> rowid = const Value.absent(),
              }) => UsuarioConversaTabelaCompanion.insert(
                idConversa: idConversa,
                idUsuario: idUsuario,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $UsuarioConversaTabelaTable,
                    UsuarioConversaTabelaData
                  >(table),
                  $$UsuarioConversaTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idConversa = false, idUsuario = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idConversa) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idConversa,
                                referencedTable:
                                    $$UsuarioConversaTabelaTableReferences
                                        ._idConversaTable(db),
                                referencedColumn:
                                    $$UsuarioConversaTabelaTableReferences
                                        ._idConversaTable(db)
                                        .idConversa,
                              )
                              as T;
                    }
                    if (idUsuario) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idUsuario,
                                referencedTable:
                                    $$UsuarioConversaTabelaTableReferences
                                        ._idUsuarioTable(db),
                                referencedColumn:
                                    $$UsuarioConversaTabelaTableReferences
                                        ._idUsuarioTable(db)
                                        .idUsuario,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UsuarioConversaTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuarioConversaTabelaTable,
      UsuarioConversaTabelaData,
      $$UsuarioConversaTabelaTableFilterComposer,
      $$UsuarioConversaTabelaTableOrderingComposer,
      $$UsuarioConversaTabelaTableAnnotationComposer,
      $$UsuarioConversaTabelaTableCreateCompanionBuilder,
      $$UsuarioConversaTabelaTableUpdateCompanionBuilder,
      (UsuarioConversaTabelaData, $$UsuarioConversaTabelaTableReferences),
      UsuarioConversaTabelaData,
      PrefetchHooks Function({bool idConversa, bool idUsuario})
    >;
typedef $$MensagemTabelaTableCreateCompanionBuilder =
    MensagemTabelaCompanion Function({
      required String idMensagem,
      required String idConversa,
      required String texto,
      required DateTime horarioEnvio,
      required bool sincronizado,
      Value<int> rowid,
    });
typedef $$MensagemTabelaTableUpdateCompanionBuilder =
    MensagemTabelaCompanion Function({
      Value<String> idMensagem,
      Value<String> idConversa,
      Value<String> texto,
      Value<DateTime> horarioEnvio,
      Value<bool> sincronizado,
      Value<int> rowid,
    });

final class $$MensagemTabelaTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $MensagemTabelaTable,
          MensagemTabelaData
        > {
  $$MensagemTabelaTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ConversaTabelaTable _idConversaTable(_$AppDatabase db) =>
      db.conversaTabela.createAlias(
        'mensagem_tabela__id_conversa__conversa_tabela__id_conversa',
      );

  $$ConversaTabelaTableProcessedTableManager get idConversa {
    final $_column = $_itemColumn<String>('id_conversa')!;

    final manager = $$ConversaTabelaTableTableManager(
      $_db,
      $_db.conversaTabela,
    ).filter((f) => f.idConversa.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idConversaTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MensagemTabelaTableFilterComposer
    extends Composer<_$AppDatabase, $MensagemTabelaTable> {
  $$MensagemTabelaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get idMensagem => $composableBuilder(
    column: $table.idMensagem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get horarioEnvio => $composableBuilder(
    column: $table.horarioEnvio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnFilters(column),
  );

  $$ConversaTabelaTableFilterComposer get idConversa {
    final $$ConversaTabelaTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.conversaTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversaTabelaTableFilterComposer(
            $db: $db,
            $table: $db.conversaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MensagemTabelaTableOrderingComposer
    extends Composer<_$AppDatabase, $MensagemTabelaTable> {
  $$MensagemTabelaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get idMensagem => $composableBuilder(
    column: $table.idMensagem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get horarioEnvio => $composableBuilder(
    column: $table.horarioEnvio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => ColumnOrderings(column),
  );

  $$ConversaTabelaTableOrderingComposer get idConversa {
    final $$ConversaTabelaTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.conversaTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversaTabelaTableOrderingComposer(
            $db: $db,
            $table: $db.conversaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MensagemTabelaTableAnnotationComposer
    extends Composer<_$AppDatabase, $MensagemTabelaTable> {
  $$MensagemTabelaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get idMensagem => $composableBuilder(
    column: $table.idMensagem,
    builder: (column) => column,
  );

  GeneratedColumn<String> get texto =>
      $composableBuilder(column: $table.texto, builder: (column) => column);

  GeneratedColumn<DateTime> get horarioEnvio => $composableBuilder(
    column: $table.horarioEnvio,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sincronizado => $composableBuilder(
    column: $table.sincronizado,
    builder: (column) => column,
  );

  $$ConversaTabelaTableAnnotationComposer get idConversa {
    final $$ConversaTabelaTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idConversa,
      referencedTable: $db.conversaTabela,
      getReferencedColumn: (t) => t.idConversa,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConversaTabelaTableAnnotationComposer(
            $db: $db,
            $table: $db.conversaTabela,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MensagemTabelaTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MensagemTabelaTable,
          MensagemTabelaData,
          $$MensagemTabelaTableFilterComposer,
          $$MensagemTabelaTableOrderingComposer,
          $$MensagemTabelaTableAnnotationComposer,
          $$MensagemTabelaTableCreateCompanionBuilder,
          $$MensagemTabelaTableUpdateCompanionBuilder,
          (MensagemTabelaData, $$MensagemTabelaTableReferences),
          MensagemTabelaData,
          PrefetchHooks Function({bool idConversa})
        > {
  $$MensagemTabelaTableTableManager(
    _$AppDatabase db,
    $MensagemTabelaTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MensagemTabelaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MensagemTabelaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MensagemTabelaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> idMensagem = const Value.absent(),
                Value<String> idConversa = const Value.absent(),
                Value<String> texto = const Value.absent(),
                Value<DateTime> horarioEnvio = const Value.absent(),
                Value<bool> sincronizado = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MensagemTabelaCompanion(
                idMensagem: idMensagem,
                idConversa: idConversa,
                texto: texto,
                horarioEnvio: horarioEnvio,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String idMensagem,
                required String idConversa,
                required String texto,
                required DateTime horarioEnvio,
                required bool sincronizado,
                Value<int> rowid = const Value.absent(),
              }) => MensagemTabelaCompanion.insert(
                idMensagem: idMensagem,
                idConversa: idConversa,
                texto: texto,
                horarioEnvio: horarioEnvio,
                sincronizado: sincronizado,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MensagemTabelaTable, MensagemTabelaData>(table),
                  $$MensagemTabelaTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idConversa = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idConversa) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idConversa,
                                referencedTable: $$MensagemTabelaTableReferences
                                    ._idConversaTable(db),
                                referencedColumn:
                                    $$MensagemTabelaTableReferences
                                        ._idConversaTable(db)
                                        .idConversa,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MensagemTabelaTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MensagemTabelaTable,
      MensagemTabelaData,
      $$MensagemTabelaTableFilterComposer,
      $$MensagemTabelaTableOrderingComposer,
      $$MensagemTabelaTableAnnotationComposer,
      $$MensagemTabelaTableCreateCompanionBuilder,
      $$MensagemTabelaTableUpdateCompanionBuilder,
      (MensagemTabelaData, $$MensagemTabelaTableReferences),
      MensagemTabelaData,
      PrefetchHooks Function({bool idConversa})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsuarioTabelaTableTableManager get usuarioTabela =>
      $$UsuarioTabelaTableTableManager(_db, _db.usuarioTabela);
  $$ConversaTabelaTableTableManager get conversaTabela =>
      $$ConversaTabelaTableTableManager(_db, _db.conversaTabela);
  $$UsuarioConversaTabelaTableTableManager get usuarioConversaTabela =>
      $$UsuarioConversaTabelaTableTableManager(_db, _db.usuarioConversaTabela);
  $$MensagemTabelaTableTableManager get mensagemTabela =>
      $$MensagemTabelaTableTableManager(_db, _db.mensagemTabela);
}
