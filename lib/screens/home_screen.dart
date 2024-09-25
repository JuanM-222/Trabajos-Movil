
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dragon Ball Z',
        style: TextStyle(
            fontSize: 24,               // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.white,),
        ),
        centerTitle: true,  
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/buscar');// Acción cuando el botón "Buscar personajes" es presionado
                },
                child: const Text('Buscar personajes'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción cuando el botón "Características" es presionado
                },
                child: const Text('Características'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción cuando el botón "Qué personaje soy" es presionado
                },
                child: const Text('Qué personaje soy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}