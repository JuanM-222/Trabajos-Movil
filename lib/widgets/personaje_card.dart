import 'package:flutter/material.dart';
import '../models/personaje.dart';

class PersonajeCard extends StatelessWidget {
  final Personaje personaje;

  const PersonajeCard({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Imagen del personaje ajustada
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Container(
              height: 250, // Ajusta la altura según lo que prefieras
              color: const Color.fromARGB(184, 133, 76, 197), // Fondo gris para la imagen
              child: Image.network(
                personaje.image, // URL de la imagen del personaje
                width: double.infinity,
                fit: BoxFit.contain, // Ajusta la imagen para que se vea completa
              ),
            ),
          ),
          // Contenido dentro de la tarjeta
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre del personaje
                Text(
                  personaje.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Información adicional del personaje
                Text(
                  'Raza: ${personaje.race}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Género: ${personaje.gender}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Ki: ${personaje.ki}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Max Ki: ${personaje.maxKi}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                // Descripción del personaje con un límite de líneas
                Text(
                  personaje.description,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 4, // Limita la descripción a 4 líneas
                  overflow: TextOverflow.ellipsis, // Muestra "..." si el texto es largo
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
