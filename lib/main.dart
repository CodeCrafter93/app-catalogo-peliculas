import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoPeliculasApp());
}

class CatalogoPeliculasApp extends StatelessWidget {
  const CatalogoPeliculasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Butaca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?q=80&w=2070&auto=format&fit=crop',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.theaters_outlined, size: 90.0, color: Colors.white),
              const SizedBox(height: 24.0),
              const Text(
                'La Butaca',
                style: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: 2.5
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                '!Hola!Bienvenido a tu catálogo',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white70,
                    letterSpacing: 1.2
                ),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF45A29E),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PantallaFichaPelicula()
                    ),
                  );
                },
                child: const Text(
                  'Ingresar',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PantallaFichaPelicula extends StatelessWidget {
  const PantallaFichaPelicula({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ficha técnica'),
        backgroundColor: const Color(0xFF0B0C10),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFF1F2833),
      body: Center(
        child: Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                    child: const Text(
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
              const Text(
                'El misterio de la interfaz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12.0),
              Row(
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
              const Text(
                'Esta tarjeta de presentación fue desarrollada utilizando los conceptos fundamentales de estructuración en el marco de trabajo de Google. A través del uso de columnas para la alineación vertical, filas para la distribución horizontal y contenedores, se logra una experiencia inmersiva.',
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