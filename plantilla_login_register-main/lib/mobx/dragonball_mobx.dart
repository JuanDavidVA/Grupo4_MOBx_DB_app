import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

import 'package:plantilla_login_register/models/models.dart';

part 'dragonball_mobx.g.dart';

class DragonBallMobX = DragonBallMobXBase with _$DragonBallMobX;

abstract class DragonBallMobXBase with Store {

  // Llistes observables
  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  ObservableList<Planets> planets = ObservableList<Planets>();

  // Accions per carregar dades des de l'API
  @action
  Future<void> loadCharacters() async {
    var url = Uri.https(
      'dragonball-api.com',
      'api/characters',
      {'limit': '58'},
    );

    final result = await http.get(url);
    final response = GetCharacters.fromRawJson(result.body);

    characters = ObservableList.of(response.items);
  }

  @action
  Future<void> loadPlanets() async {
    var url = Uri.https(
      'dragonball-api.com',
      'api/planets',
      {'limit': '20'},
    );

    final result = await http.get(url);
    final response = GetPlanets.fromRawJson(result.body);

    planets = ObservableList.of(response.items);
  }
}
