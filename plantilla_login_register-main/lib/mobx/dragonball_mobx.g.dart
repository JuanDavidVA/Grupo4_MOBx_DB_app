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

  @override
  String toString() {
    return '''
characters: ${characters},
planets: ${planets}
    ''';
  }
}
