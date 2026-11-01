import 'package:flutter/material.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/screens/conversa_screen/conversa_screen.dart';
import 'package:ola_messenger/screens/perfil_screen/perfil_screen.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      await context.read<Storage>().sincronizarUsuarioNuvemParaLocal();
      await context.read<Storage>().atualizarListaTodosUsuarios();
      print(
        "numero usuarios local: ${context.read<Storage>().listaTodosUsuarios.length}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final storage = context.watch<Storage>();
    List<Usuario> listaTodosUsuarios = storage.listaTodosUsuarios;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Sair"),
        ],
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilScreen()),
              );
            case 2:
              context.read<Storage>().deslogar();
          }
        },
      ),
      appBar: AppBar(title: Text("Olá Messenger")),
      body: Column(
        children: [
          Autocomplete<Usuario>(displayStringForOption: (option) => '${option.nome} ${option.sobrenome}', optionsBuilder: (textEditingValue) {
            if(textEditingValue.text.isEmpty){
              return [];
            }

            return listaTodosUsuarios.where((usuario) {
              final nomeCompleto = '${usuario.nome} ${usuario.sobrenome}';
              return nomeCompleto.toLowerCase().contains(textEditingValue.text);              
            },);
          },
          onSelected: (option) {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ConversaScreen(destinatario: option),
                  ),
                );      
          },),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(listaTodosUsuarios[index].nome),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ConversaScreen(destinatario: listaTodosUsuarios[index]),
                  ),
                ),
              ),
              itemCount: listaTodosUsuarios.length,
            ),
          ),
        ],
      ),
    );
  }
}
