import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/screens/main_screen/main_screen.dart';
import 'package:ola_messenger/screens/login_screen/login_screen.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class RoteadorScreen extends StatefulWidget {
  const RoteadorScreen({super.key});

  @override
  State<RoteadorScreen> createState() => _RoteadorScreenState();
}

class _RoteadorScreenState extends State<RoteadorScreen> {

  late User? usuario;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pegarUsuario();
    
  }
  @override
  Widget build(BuildContext context) {
    return usuario == null ? LoginScreen() : MainScreen();
  }

 void pegarUsuario(){
  usuario = context.read<Storage>().pegarUsuario();
 }
}