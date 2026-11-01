import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/repository/repository.dart';

class Storage extends ChangeNotifier{
  AppDatabase database;  
  late Repository repository = Repository(database: database);

  Storage({required this.database});

  ////Variaveis de estado
  
  List<Usuario> listaTodosUsuarios = [];

  Future<void> fazerLogin(String email, String senha)async{
   await repository.fazerLogin(email, senha);   
  }

  Future<void> criarConta(String email, String senha)async{
   await repository.criarConta(email, senha);
  }

  Future<void> deslogar()async{
    await repository.deslogar();
  }

  User? pegarUsuario(){
   return repository.pegarUsuario();
  }

  ////FUNÇÕES RELACIONADAS A USUARIO
  Future<void> adicionarUsuarioLocal(Usuario usuario)async{
    await repository.adicionarUsuarioLocal(usuario); 
  }

  Future<void> adicionarUsuarioNuvem(Usuario usuario)async{
    await repository.adicionarUsuarioNuvem(usuario);
  }

  Future<List<Usuario>> pegarListaUsuarios()async{
    return await repository.pegarListaUsuarios();
  }

  Future<void> atualizarListaTodosUsuarios()async{
    listaTodosUsuarios = await repository.pegarListaUsuarios();
    notifyListeners();
  }

  ////FUNÇÕES RELACIONADAS A SINCRONIZAÇÃO
  Future<void> sincronizarUsuarioNuvemParaLocal()async{
    await repository.sincronizarUsuarioNuvemParaLocal();
  }
}