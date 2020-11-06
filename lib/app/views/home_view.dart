import 'package:coin_converter/app/components/currency_box.dart';
import 'package:coin_converter/app/controllers/currency_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CurrencyController currencyController;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    super.initState();
    currencyController = CurrencyController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/imageCoin.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              CurrencyBox(
                selectedItem: currencyController.toCurrency,
                controller: toText,
                items: currencyController.currencies,
                onChanged: (model) {
                  setState(() {
                    currencyController.toCurrency = model;
                  });
                },
              ),
              SizedBox(height: 10),
              CurrencyBox(
                selectedItem: currencyController.fromCurrency,
                controller: fromText,
                items: currencyController.currencies,
                onChanged: (model) {
                  setState(() {
                    currencyController.fromCurrency = model;
                  });
                },
              ),
              SizedBox(height: 50),
              Container(
                width: 350,
                height: 50,
                child: RaisedButton(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    currencyController.convert();
                  },
                  child: Text('CONVERTER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
