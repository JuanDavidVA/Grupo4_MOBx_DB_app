// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dragonball_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DragonBallMobX on DragonBallMobXBase, Store {
  late final _$charactersAtom =
      Atom(name: 'DragonBallMobXBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$planetsAtom =
      Atom(name: 'DragonBallMobXBase.planets', context: context);

  @override
  ObservableList<Planets> get planets {
    _$planetsAtom.reportRead();
    return super.planets;
  }

  @override
  set planets(ObservableList<Planets> value) {
    _$planetsAtom.reportWrite(value, super.planets, () {
      super.planets = value;
    });
  }

  late final _$isLoadingCharactersAtom =
      Atom(name: 'DragonBallMobXBase.isLoadingCharacters', context: context);

  @override
  bool get isLoadingCharacters {
    _$isLoadingCharactersAtom.reportRead();
    return super.isLoadingCharacters;
  }

  @override
  set isLoadingCharacters(bool value) {
    _$isLoadingCharactersAtom.reportWrite(value, super.isLoadingCharacters, () {
      super.isLoadingCharacters = value;
    });
  }

  late final _$isLoadingPlanetsAtom =
      Atom(name: 'DragonBallMobXBase.isLoadingPlanets', context: context);

  @override
  bool get isLoadingPlanets {
    _$isLoadingPlanetsAtom.reportRead();
    return super.isLoadingPlanets;
  }

  @override
  set isLoadingPlanets(bool value) {
    _$isLoadingPlanetsAtom.reportWrite(value, super.isLoadingPlanets, () {
      super.isLoadingPlanets = value;
    });
  }

  late final _$isCardSwiperVisibleAtom =
      Atom(name: 'DragonBallMobXBase.isCardSwiperVisible', context: context);

  @override
  bool get isCardSwiperVisible {
    _$isCardSwiperVisibleAtom.reportRead();
    return super.isCardSwiperVisible;
  }

  @override
  set isCardSwiperVisible(bool value) {
    _$isCardSwiperVisibleAtom.reportWrite(value, super.isCardSwiperVisible, () {
      super.isCardSwiperVisible = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'DragonBallMobXBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadCharactersAsyncAction =
      AsyncAction('DragonBallMobXBase.loadCharacters', context: context);

  @override
  Future<void> loadCharacters() {
    return _$loadCharactersAsyncAction.run(() => super.loadCharacters());
  }

  late final _$loadPlanetsAsyncAction =
      AsyncAction('DragonBallMobXBase.loadPlanets', context: context);

  @override
  Future<void> loadPlanets() {
    return _$loadPlanetsAsyncAction.run(() => super.loadPlanets());
  }

  late final _$DragonBallMobXBaseActionController =
      ActionController(name: 'DragonBallMobXBase', context: context);

  @override
  void toggleCardSwiperVisibility() {
    final _$actionInfo = _$DragonBallMobXBaseActionController.startAction(
        name: 'DragonBallMobXBase.toggleCardSwiperVisibility');
    try {
      return super.toggleCardSwiperVisibility();
    } finally {
      _$DragonBallMobXBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextFormField validateCorreu(
      void Function(String?) onSavedCallback, RegExp emailRegExp) {
    final _$actionInfo = _$DragonBallMobXBaseActionController.startAction(
        name: 'DragonBallMobXBase.validateCorreu');
    try {
      return super.validateCorreu(onSavedCallback, emailRegExp);
    } finally {
      _$DragonBallMobXBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextFormField validateContrasenya(
      void Function(String?) onSavedCallback, RegExp contRegExp) {
    final _$actionInfo = _$DragonBallMobXBaseActionController.startAction(
        name: 'DragonBallMobXBase.validateContrasenya');
    try {
      return super.validateContrasenya(onSavedCallback, contRegExp);
    } finally {
      _$DragonBallMobXBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
characters: ${characters},
planets: ${planets},
isLoadingCharacters: ${isLoadingCharacters},
isLoadingPlanets: ${isLoadingPlanets},
isCardSwiperVisible: ${isCardSwiperVisible},
errorMessage: ${errorMessage}
    ''';
  }
}
