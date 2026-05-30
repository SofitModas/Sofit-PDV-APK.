// ============================================================
//  SOFIT MODAS — main.dart
// ============================================================

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'controllers/cart_controller.dart';
import 'screens/catalog_screen.dart';

void main() async {
  // Garante que os bindings nativos estejam prontos antes de ligar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase padrão do seu projeto
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
      ],
      child: const SofitModasApp(),
    ),
  );
}

class SofitModasApp extends StatelessWidget {
  const SofitModasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sofit Modas PDV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: Colors.white,
      ),
      // Adicionamos o home aqui, que faltava no seu trecho anterior
      home: const CatalogScreen(),
    );
  }
}
