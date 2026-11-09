import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/screens/cadastro_screen/cadastro_screen.dart';
import 'package:ola_messenger/screens/main_screen/main_screen.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: loginController,
              decoration: InputDecoration(hint: Text('Digite seu login')),
            ),
            TextFormField(
              controller: senhaController,
              decoration: InputDecoration(hint: Text('Digite sua senha')),
            ),
            ElevatedButton(
              onPressed: () {
                tentarLogar();
              },
              child: Text('Entrar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroScreen()),
                );
              },
              child: Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> tentarLogar() async {
    try {
      await context.read<Storage>().fazerLogin(
        loginController.text,
        senhaController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
