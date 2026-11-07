import 'package:flutter/material.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class MensagemTile extends StatefulWidget {
  final Mensagem mensagem;

  const MensagemTile({super.key, required this.mensagem});

  @override
  State<MensagemTile> createState() => _MensagemTileState();
}

class _MensagemTileState extends State<MensagemTile> {
  @override
  Widget build(BuildContext context) {
    final idUsuario = context.read<Storage>().pegarUsuario()!.uid;
    return Container(
      color: idUsuario == widget.mensagem.idRemetente
          ? Colors.green
          : Colors.white,
      child: Column(
        children: [
          Text(widget.mensagem.texto),
          Row(children: [iconStatus(), Text(horarioEnvio)]),
        ],
      ),
    );
  }

  String get horarioEnvio {
    final horario = widget.mensagem.horarioEnvio;

    return '${horario.hour.toString().padLeft(2, '0')}:${horario.minute.toString().padLeft(2, '0')}';
  }

  Icon iconStatus() {
    switch (widget.mensagem.statusMensagem) {
      case StatusMensagem.pendente:
        return Icon(Icons.timer, color: Colors.grey);
      case StatusMensagem.enviada:
        return Icon(Icons.check, color: Colors.grey);
      case StatusMensagem.entregue:
        return Icon(Icons.done_all, color: Colors.grey);
      case StatusMensagem.lida:
        return Icon(Icons.done_all, color: Colors.green);
    }
  }
}
