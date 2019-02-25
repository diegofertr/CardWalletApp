import 'package:flutter/material.dart';
import 'package:card_wallet/ui/widgets/card_list.dart';
import 'card_type.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text(
          'Wallet',
          style:TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w600
          )
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black
          ),
          onPressed: (){
            print('Button *menu* presionado');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black
            ),
            onPressed: (){
              print('Button *add* presionado');
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CardType()
              ));
            },
          )
        ],
      ),
      body: CardList(),
    );
  }
}