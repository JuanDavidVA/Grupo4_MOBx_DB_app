import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:plantilla_login_register/models/models.dart';

part 'dragonball_mobx.g.dart';

class DragonBallMobX = DragonBallMobXBase with _$DragonBallMobX;

abstract class DragonBallMobXBase with Store {
  // Listas observables
  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  ObservableList<Planets> planets = ObservableList<Planets>();

  // Estados de carga
  @observable
  bool isLoadingCharacters = false;

  @observable
  bool isLoadingPlanets = false;

  // Estado para controlar la visibilidad del CardSwipers
  @observable
  bool isCardSwiperVisible = false;

  // Variables de error
  @observable
  String errorMessage = '';

  // Acciones para cargar los datos desde la API
  @action
  Future<void> loadCharacters() async {
    isLoadingCharacters = true;
    errorMessage = '';
    try {
      var url = Uri.https(
        'dragonball-api.com',
        'api/characters',
        {'limit': '58'},
      );

      final result = await http.get(url);

      if (result.statusCode == 200) {
        final response = GetCharacters.fromRawJson(result.body);
        characters = ObservableList.of(response.items);
      } else {
        errorMessage = 'Error al cargar personajes. Código de estado: ${result.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Error de conexión: $e';
    } finally {
      isLoadingCharacters = false;
    }
  }

  @action
  Future<void> loadPlanets() async {
    isLoadingPlanets = true;
    errorMessage = '';
    try {
      var url = Uri.https(
        'dragonball-api.com',
        'api/planets',
        {'limit': '20'},
      );

      final result = await http.get(url);

      if (result.statusCode == 200) {
        final response = GetPlanets.fromRawJson(result.body);
        planets = ObservableList.of(response.items);
      } else {
        errorMessage = 'Error al cargar planetas. Código de estado: ${result.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Error de conexión: $e';
    } finally {
      isLoadingPlanets = false;
    }
  }

  @action
  void toggleCardSwiperVisibility() {
    if(isCardSwiperVisible == false){
      isCardSwiperVisible = true;
    }else{
      isCardSwiperVisible = false;
    }
  }
}
