import 'package:flutter/material.dart';
import 'package:dragon_ball_z_app_movil/screens/home_screen.dart';
import 'package:dragon_ball_z_app_movil/screens/buscar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personajes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),        // Ruta para Home
        '/buscar': (context) => const BuscarPersonajes(),  // Ruta para Buscar personajes
      }, // Inicializamos con la pantalla de Home
    );
  }
}