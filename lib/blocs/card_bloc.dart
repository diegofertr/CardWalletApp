import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:card_wallet/models/card_color_model.dart';

// TODO: Ir en los vídeos al #3 en el minuto 11:46 para proseguir con el tutorial

class CardBloc {
  BehaviorSubject<String> _cardHolderName = BehaviorSubject<String>();
  BehaviorSubject<String> _cardNumber = BehaviorSubject<String>();
  BehaviorSubject<String> _cardMonth = BehaviorSubject<String>();
  BehaviorSubject<String> _cardYear = BehaviorSubject<String>();
  BehaviorSubject<String> _cardCvv = BehaviorSubject<String>();
  BehaviorSubject<String> _cardType = BehaviorSubject<String>();
  BehaviorSubject<int> _cardColorIndexSelected = BehaviorSubject<int>(seedValue: 0);

  final _cardsColors = BehaviorSubject<List<CardColorModel>>();

  // Add data stream
  Function(String) get changeCardHolderName => _cardHolderName.sink.add;
  Function(String) get changeCardNumber => _cardNumber.sink.add;
  Function(String) get changeCardMonth => _cardMonth.sink.add;
  Function(String) get changeCardYear => _cardYear.sink.add;
  Function(String) get changeCardCvv => _cardCvv.sink.add;
  Function(String) get selectCardType => _cardType.sink.add;

  // Retrieve data from stream
  Stream<String> get cardHolderName => _cardHolderName.stream.transform(validateCardHolderName);
  Stream<String> get cardNumber => _cardNumber.stream.transform(validateCardNumber);
  Stream<String> get cardMonth => _cardMonth.stream.transform(validateCardMonth);
  Stream<String> get cardYear => _cardYear.stream.transform(validateCardYear);
  Stream<String> get cardCvv => _cardCvv.stream.transform(validateCardCvv);
  Stream<String> get cardType => _cardType.stream;
  Stream<int> get cardColorIndexSelected => _cardColorIndexSelected.stream;

  void dispose() {
    _cardHolderName.close();
    _cardNumber.close();
    _cardMonth.close();
    _cardYear.close();
    _cardCvv.close();
    _cardsColors.close();
    _cardColorIndexSelected.close();
    _cardType.close();
  }
}