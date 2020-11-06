import 'package:coin_converter/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class CurrencyController {
  List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel toCurrency;
  CurrencyModel fromCurrency;

  CurrencyController({this.toText, this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double total = 0;

    if (fromCurrency.name == 'Real') {
      total = value * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      total = value * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      total = value * toCurrency.euro;
    } else if (fromCurrency.name == 'BitCoin') {
      total = value * toCurrency.bitcoin;
    } else {
      total = 0;
    }

    fromText.text = total.toStringAsFixed(2);
  }
}
