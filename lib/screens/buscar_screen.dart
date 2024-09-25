import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/personaje.dart';
import '../widgets/personaje_card.dart';  // Importamos el widget personalizado

class BuscarPersonajes extends StatefulWidget {
  const BuscarPersonajes({super.key});

  @override
  BuscarPersonajesState createState() => BuscarPersonajesState();
}

class BuscarPersonajesState extends State<BuscarPersonajes> {
  ApiService apiService = ApiService();
  Future<List<Personaje>>? personajes;

  @override
  void initState() {
    super.initState();
    personajes = apiService.fetchPersonajes();  // Cargar la primera página de personajes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar personajes'),
      ),
      body: FutureBuilder<List<Personaje>>(
        future: personajes,  // Asegúrate de que este es el Future que inicializaste
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar personajes'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Personaje personaje = snapshot.data![index];
                return PersonajeCard(personaje: personaje);  // Aquí usamos el widget PersonajeCard
              },
            );
          } else {
            return const Center(child: Text('No se encontraron personajes'));
          }
        },
      ),
    );
  }
}

