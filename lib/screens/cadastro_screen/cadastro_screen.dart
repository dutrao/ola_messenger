import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hint: Text('Digite o login')),
            ),
            TextFormField(
              controller: senhaController,
              decoration: InputDecoration(hint: Text('Digite a senha')),
            ),
            ElevatedButton(
              onPressed: () async {
                await tentarCadastrar();
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> tentarCadastrar() async {
    try {
      await context.read<Storage>().criarConta(
        emailController.text,
        senhaController.text,
      );
      await context.read<Storage>().deslogar();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
