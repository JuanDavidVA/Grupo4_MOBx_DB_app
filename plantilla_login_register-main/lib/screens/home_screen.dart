import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:plantilla_login_register/mobx/dragonball_mobx.dart';
import 'package:plantilla_login_register/models/models.dart';
import 'package:plantilla_login_register/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final dbStore = DragonBallMobX();

  @override
  Widget build(BuildContext context) {
    // Email / texto que mandas desde el login
    final missatge =
        ModalRoute.of(context)!.settings.arguments as String? ?? '';

    // Cargar datos (lo mantengo como lo tenías)
    dbStore.loadCharacters();
    dbStore.loadPlanets();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inici'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // 👈 aquí está el cambio importante
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Benvingut',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  missatge,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Botón para mostrar/ocultar los CardSwiper
                Observer(
                  builder: (_) {
                    return ElevatedButton(
                      onPressed: dbStore.toggleCardSwiperVisibility,
                      child: Text(
                        dbStore.isCardSwiperVisible
                            ? 'Ocultar CardSwipers'
                            : 'Mostrar CardSwipers',
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Contenido principal
                Observer(
                  builder: (_) {
                    if (!dbStore.isCardSwiperVisible) {
                      return const SizedBox.shrink();
                    }

                    if (dbStore.isLoadingCharacters ||
                        dbStore.isLoadingPlanets) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (dbStore.errorMessage.isNotEmpty) {
                      return Text(
                        dbStore.errorMessage,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      );
                    }

                    return Column(
                      children: [
                        if (dbStore.characters.isNotEmpty) ...[
                          CardSwiper<Character>(
                            items: dbStore.characters.toList(),
                            imageUrlBuilder: (c) => c.image,
                            nameBuilder: (c) => c.name,
                          ),
                          const SizedBox(height: 24),
                        ],
                        if (dbStore.planets.isNotEmpty)
                          CardSwiper<Planets>(
                            items: dbStore.planets.toList(),
                            imageUrlBuilder: (p) => p.image,
                            nameBuilder: (p) => p.name,
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
