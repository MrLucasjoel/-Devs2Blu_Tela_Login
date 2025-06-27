
import 'package:flutter/material.dart';
import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        // Cor primária do app
        primarySwatch: Colors.green,

        // Estilo global do botão "Entrar"
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,    // Fundo do botão
            foregroundColor: Colors.black,    // Texto branco
            padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 12,
            ),
          ),
        ),

        // Estilo global do botão "Criar conta"
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black, // Texto verde
          ),
        ),
      ),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
