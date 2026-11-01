import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/firebase_options.dart';
import 'package:ola_messenger/screens/roteador_screen/roteador_screen.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  AppDatabase database = AppDatabase();
 
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: database),       
        ChangeNotifierProvider<Storage>(create: (_) => Storage(database: database)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ola Messenger',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: RoteadorScreen(),
    );
  }
}
