import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart'; // Importa MobX para usar Observer
import 'package:flutter_mobx/flutter_mobx.dart'; // Para usar Observer con widgets

// Simulamos la clase DragonBallMobX
class DragonBallMobX {
  // Simulación de personajes y planetas
  ObservableList<Character> characters = ObservableList<Character>();
  ObservableList<Planet> planets = ObservableList<Planet>();

  // Métodos de carga (simulados)
  void loadCharacters() {
    characters.addAll([
      Character(name: "Goku"),
      Character(name: "Vegeta"),
      Character(name: "Piccolo"),
    ]);
  }

  void loadPlanets() {
    planets.addAll([
      Planet(name: "Earth"),
      Planet(name: "Namek"),
      Planet(name: "Vegeta"),
    ]);
  }
}

// Modelos de personajes y planetas
class Character {
  final String name;
  Character({required this.name});
}

class Planet {
  final String name;
  Planet({required this.name});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbStore = DragonBallMobX();
  bool isCardSwiperVisible = false;

  @override
  void initState() {
    super.initState();
    dbStore.loadCharacters();
    dbStore.loadPlanets();
  }

  @override
  Widget build(BuildContext context) {
    final missatge = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Inici'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // TODO: Agregar lógica de logout
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Texto con mensaje
          Text(
            missatge,
            style: TextStyle(
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),

          // Botón que muestra el CardSwiper
          ElevatedButton(
            onPressed: () {
              setState(() {
                isCardSwiperVisible = !isCardSwiperVisible;
              });
            },
            child: Text(isCardSwiperVisible ? "Ocultar CardSwiper" : "Mostrar CardSwiper"),
          ),

          // Si isCardSwiperVisible es true, mostramos el CardSwiper
          if (isCardSwiperVisible)
            Expanded(
              child: PageView(
                children: [
                  // Mostrar personajes
                  Observer(
                    builder: (_) => ListView(
                      children: dbStore.characters
                          .map((c) => Card(
                                child: ListTile(title: Text(c.name)),
                              ))
                          .toList(),
                    ),
                  ),
                  // Mostrar planetas
                  Observer(
                    builder: (_) => ListView(
                      children: dbStore.planets
                          .map((p) => Card(
                                child: ListTile(title: Text(p.name)),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
