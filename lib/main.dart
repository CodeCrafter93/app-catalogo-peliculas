import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                    letterSpacing: 2.5),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CatalogoHttpScreen()),
                  );
                },
                child: const Text(
                  'Ver personajes (PokeAPI)',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CatalogoHttpScreen extends StatefulWidget {
  const CatalogoHttpScreen({super.key});

  @override
  State<CatalogoHttpScreen> createState() => _CatalogoHttpScreenState();
}

class _CatalogoHttpScreenState extends State<CatalogoHttpScreen> {
  List<dynamic> personajes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataDeInternet();
  }

  Future<void> fetchDataDeInternet() async {
    try {
      final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=15');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final dataDecodificada = json.decode(response.body);

        setState(() {
          personajes = dataDecodificada['results'];
          isLoading = false;
        });
      } else {
        throw Exception('Falló la conexión a la API');
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      debugPrint('Error en la petición: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2833),
      appBar: AppBar(
        title: const Text('Directorio HTTP'),
        backgroundColor: const Color(0xFF0B0C10),
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(
          child: CircularProgressIndicator(color: Color(0xFF66FCF1)))
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: personajes.length,
        itemBuilder: (context, index) {
          final personaje = personajes[index];
          return Card(
            color: const Color(0xFF0B0C10),
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF45A29E),
                child: Icon(Icons.data_object, color: Colors.white),
              ),
              title: Text(
                personaje['name'].toString().toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(
                'Ruta de red: ${personaje['url']}',
                style: const TextStyle(color: Colors.white54),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white30),
            ),
          );
        },
      ),
    );
  }
}