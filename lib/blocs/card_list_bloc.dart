import 'dart:async';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:card_wallet/models/card_model.dart';
import 'package:card_wallet/helpers/card_colors.dart';

class CardListBloc {
  // StreamController
  BehaviorSubject<List<CardResults>> _cardsCollection =BehaviorSubject<List<CardResults>>();

  List<CardResults> _cardResults;

  // Retrieve data from stream
  Stream<List<CardResults>> get cardList => _cardsCollection.stream;

  void initialData() async {
    // cargando datos del archivo json definido en /data/initialData.json
    var initialData = await rootBundle.loadString('data/initialData.json');
    var decodedJson =jsonDecode(initialData);
    _cardResults =CardModel.fromJson(decodedJson).results;

    for (var i = 0; i < _cardResults.length; i++) {
      // TODO: Revisar cuando sea de mayor cantidad el json
      _cardResults[i].cardColor = CardColor.baseColors[i];
    }

    _cardsCollection.sink.add(_cardResults);
  }

  CardListBloc() {
    initialData();
  }

  void dispose () {
    _cardsCollection.close();
  }
}

final cardListBloc = new CardListBloc();