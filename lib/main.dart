import 'package:flutter/material.dart';

void main() {
  runApp(const AplicacionCatalogoWidgets());
}

class AplicacionCatalogoWidgets extends StatelessWidget {
  const AplicacionCatalogoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Películas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PantallaFichaPelicula(),
    );
  }
}

class PantallaFichaPelicula extends StatelessWidget {
  const PantallaFichaPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LDSW - Widgets básicos'),
        backgroundColor: const Color(0xFF0B0C10),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1F2833), // Fondo general de la aplicación
      body: Center(
        child: Container( // Implementación del widget Container
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xFF0B0C10),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 15.0,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column( // Implementación del widget Column
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack( // Implementación del widget Stack
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF45A29E),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.local_movies_rounded,
                        size: 90,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12.0),
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 5.0,
                            offset: Offset(0, 2),
                          )
                        ]
                    ),
                    child: const Text( // Implementación del widget Text anidado
                      'NUEVO ESTRENO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 12.0,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text( // Implementación del widget Text principal
                'El misterio de la interfaz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Row( // Implementación del widget Row
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.star_rounded, color: Colors.amber, size: 24),
                      SizedBox(width: 6.0),
                      Text(
                        '4.9 / 5.0',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Text(
                      'Suspenso',
                      style: TextStyle(
                        color: Color(0xFF66FCF1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const Text( // Implementación del widget Text para párrafos extensos
                'Esta tarjeta de presentación fue desarrollada utilizando los conceptos fundamentales de estructuración en el marco de trabajo de Google. A través del uso de columnas para la alineación vertical, filas para la distribución horizontal de la información técnica, contenedores para el manejo del diseño espacial y pilas para la superposición gráfica, se logra una experiencia de usuario inmersiva y altamente funcional, preparada para integrarse en un catálogo completo.',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15.0,
                  height: 1.6,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}