import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/usuario.dart';

class ConversaScreen extends StatefulWidget {
  final Usuario destinatario;
  const ConversaScreen({super.key, required this.destinatario});

  @override
  State<ConversaScreen> createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.destinatario.nome)),
      body: Column(
        children: [
          /*Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Container(),
            ),
          ),*/
        ],
      ),
    );
  }
}
