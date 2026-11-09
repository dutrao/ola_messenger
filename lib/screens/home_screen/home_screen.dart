import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/screens/conversa_screen/conversa_screen.dart';
import 'package:ola_messenger/screens/perfil_screen/perfil_screen.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  List<Usuario> listaTodosUsuarios;
  HomeScreen({super.key, required this.listaTodosUsuarios});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Autocomplete<Usuario>(displayStringForOption: (option) => '${option.nome} ${option.sobrenome}', optionsBuilder: (textEditingValue) {
            if(textEditingValue.text.isEmpty){
              return [];
            }

            return widget.listaTodosUsuarios.where((usuario) {
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
                title: Text(widget.listaTodosUsuarios[index].nome),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ConversaScreen(destinatario: widget.listaTodosUsuarios[index]),
                  ),
                ),
              ),
              itemCount: widget.listaTodosUsuarios.length,
            ),
          ),
        ],
      );
  }
}