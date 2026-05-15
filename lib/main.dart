import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
                    fontSize: 42.0, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2.5),
              ),
              const SizedBox(height: 12.0),
              const Text(
                '¡Hola! Bienvenido a tu catálogo',
                style: TextStyle(fontSize: 18.0, color: Colors.white70),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF45A29E),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AgregarPeliculaScreen()),
                  );
                },
                child: const Text(
                  'Sugerir película (Firebase)',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AgregarPeliculaScreen extends StatefulWidget {
  const AgregarPeliculaScreen({super.key});

  @override
  State<AgregarPeliculaScreen> createState() => _AgregarPeliculaScreenState();
}

class _AgregarPeliculaScreenState extends State<AgregarPeliculaScreen> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();

  bool isSaving = false;

  Future<void> _guardarPelicula() async {
    if (_tituloController.text.isEmpty || _generoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, llena todos los campos')),
      );
      return;
    }

    setState(() => isSaving = true);

    try {
      await FirebaseFirestore.instance.collection('peliculas').add({
        'titulo': _tituloController.text,
        'genero': _generoController.text,
        'fecha_agregada': Timestamp.now(),
      });

      _tituloController.clear();
      _generoController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Película guardada en la base de datos exitosamente!'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2833),
      appBar: AppBar(
        title: const Text('Agregar a Firebase'),
        backgroundColor: const Color(0xFF0B0C10),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Añade una película al sistema',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _tituloController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Título de la película',
                labelStyle: const TextStyle(color: Colors.white54),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF45A29E))),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF66FCF1))),
                fillColor: const Color(0xFF0B0C10),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _generoController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Género (ej. Ciencia ficción)',
                labelStyle: const TextStyle(color: Colors.white54),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF45A29E))),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF66FCF1))),
                fillColor: const Color(0xFF0B0C10),
                filled: true,
              ),
            ),
            const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF66FCF1),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: isSaving ? null : _guardarPelicula,
          child: isSaving
              ? const CircularProgressIndicator(color: Colors.black)
              : const Text(
            'Guardar en la nube',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}