import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantilla_login_register/mobx/dragonball_mobx.dart'; 
import 'package:plantilla_login_register/models/models.dart';
import 'package:plantilla_login_register/widgets/card_swiper.dart';  

class HomeScreen extends StatelessWidget {
  final dbStore = DragonBallMobX();

  @override
  Widget build(BuildContext context) {
    final missatge = ModalRoute.of(context)!.settings.arguments as String;

    // Llamar a los métodos para cargar los datos cuando se inicia la pantalla
    dbStore.loadCharacters();
    dbStore.loadPlanets();

    return Scaffold(
      appBar: AppBar(
        title: Text('Inici'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // TODO: Lógica de logout
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Mensaje de bienvenida
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

          // Botón para alternar visibilidad del CardSwiper
          Observer(
            builder: (_) {
              return ElevatedButton(
                onPressed: () {
                  dbStore.toggleCardSwiperVisibility();  // Cambiar visibilidad
                },
                child: Text(dbStore.isCardSwiperVisible ? "Ocultar CardSwipers" : "Mostrar CardSwipers"),
              );
            },
          ),

          // Mostrar el CardSwiper solo si está visible
          Observer(
            builder: (_) {
              if (!dbStore.isCardSwiperVisible) {
                return Container(); 
              }

              return Expanded(
                child: Column(
                  children: [
                    // CardSwiper con personajes
                    Observer(
                      builder: (_) {
                        if (dbStore.isLoadingCharacters) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (dbStore.characters.isEmpty) {
                          return Center(child: Text('No hay personajes disponibles.'));
                        }

                        return CardSwiper<Character>(
                          items: dbStore.characters,
                          imageUrlBuilder: (character) => character.image,
                          nameBuilder: (character) => character.name,
                        );
                      },
                    ),
                    // CardSwiper con planetas
                    Observer(
                      builder: (_) {
                        if (dbStore.isLoadingPlanets) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (dbStore.planets.isEmpty) {
                          return Center(child: Text('No hay planetas disponibles.'));
                        }

                        return CardSwiper<Planets>(
                          items: dbStore.planets,
                          imageUrlBuilder: (planet) => planet.image,
                          nameBuilder: (planet) => planet.name,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}