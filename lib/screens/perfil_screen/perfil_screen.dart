import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Column(
        children: [
          Text('Nome'),
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(hint: Text('Digite seu nome')),
          ),
          Text('Sobrenome'),
          TextFormField(
            controller: sobrenomeController,
            decoration: InputDecoration(hint: Text('Digite seu sobrenome')),
          ),
          ElevatedButton(
            onPressed: () async {
              await adicionarOuAtualizarUsuarioLocalENuvem();
            },
            child: Text('Atualizar dados'),
          ),
        ],
      ),
    );
  }

  Future<void> adicionarOuAtualizarUsuarioLocalENuvem() async {
    String idUsuario = context.read<Storage>().pegarUsuario()!.uid;
    Usuario usuario = Usuario(
      idUsuario: idUsuario,
      nome: nomeController.text,
      sobrenome: sobrenomeController.text,
      sincronizado: true,
    );
    final timer = Timer(Duration(seconds: 6), () {
      if(!mounted)return;
      mostrarAvisoLentidao();
    });
    try {
      await context.read<Storage>().adicionarUsuarioNuvem(usuario);     
      await context.read<Storage>().adicionarUsuarioLocal(usuario);       
      if(!mounted)return;
      mostrarAvisoFinalizado();
      print("Sucesso ao adicionar ou atualizar usuario");
    } on Exception catch (e) {      
      if(!mounted)return;
      mostrarAvisoErro();
      print('erro ao adicionar/atualizar usuario $e');
      // TODO
    } finally {
      timer.cancel();
    }
  }

  void mostrarAvisoLentidao() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            Text(" Lentidão no serviço. Verifique a conexão com a internet"),
          ],
        ),
      ),
    );
  }

  void mostrarAvisoFinalizado() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            Text(" Sucesso ao atualizar perfil"),
          ],
        ),
      ),
    );
  }

  void mostrarAvisoErro() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.close, color: Colors.red),
            Text(" Erro ao atualizar perfil. Tente novamente"),
          ],
        ),
      ),
    );
  }
}
