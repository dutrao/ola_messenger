import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';
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

  ////FUNÇÕES RELACIONADAS A USUARIOCONVERSA  
  Future<void> adicionarUsuarioConversaLocal(UsuarioConversa usuarioConversa)async{
    await repository.adicionarUsuarioConversaLocal(usuarioConversa);
  }

  Future<Conversa?> pegarConversaEntreDoisUsuariosLocal(String idUsuario01, String idUsuario02)async{
    return await repository.pegarConversaEntreDoisUsuariosLocal(idUsuario01, idUsuario02);
  }

  ////FUNÇÕES RELACIONADAS A CONVERSA
  Future<void> adicionarConversaLocal(Conversa conversa)async{
    await repository.adicionarConversaLocal(conversa);
  }

  ////FUNÇÕES RELACIONADAS A MENSAGEM
  Future<void> adicionarMensagemLocal(Mensagem mensagem)async{
    await repository.adicionarMensagemLocal(mensagem);
  }

  Future<void> adicionarMensagemNuvem(Mensagem mensagem)async{
    await repository.adicionarMensagemNuvem(mensagem);
  }

  Future<List<Mensagem>> buscarMensagensPorIdConversa(String idConversa) async{
   return await repository.buscarMensagensPorIdConversa(idConversa);
  }

  ////FUNÇÕES RELACIONADAS A SINCRONIZAÇÃO
  Future<void> sincronizarUsuarioNuvemParaLocal()async{
    await repository.sincronizarUsuarioNuvemParaLocal();
  }
}