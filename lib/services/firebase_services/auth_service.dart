import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> criarConta(String email, String senha)async{
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> fazerLogin(String email, String senha)async{
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
  }

  Future<void> deslogar()async{
    await firebaseAuth.signOut();
  }

  User? pegarUsuario(){
    User? usuario = firebaseAuth.currentUser;
    return usuario;
  }
}