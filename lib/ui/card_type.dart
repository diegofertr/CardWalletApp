import 'package:flutter/material.dart';
import 'package:card_wallet/ui/widgets/my_appbar.dart';

class CardType extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _buildTextInfo =Padding(
      padding: EdgeInsets.fromLTRB(1.0, 20.0, 10.0, 0.0),
      child: Text.rich(
        TextSpan(
          text: 'You can now add gift cards with a specific balance into wallet. When the card hits \$0.00 it will automatically dissapear. Want to know if your gift card will link?. ',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[700]
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Learn More',
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              )
            )
          ]
        ),
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
      appBar: MyAppbar(
        appBarTitle: 'Select Type',
        leadingIcon: Icons.clear,
        context: context,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildRaisedButton(
              buttonColor: Colors.lightBlue,
              buttonText: 'Credit Card',
              textColor: Colors.white,
              context: context
            ),
            _buildRaisedButton(
              buttonColor: Colors.grey[100],
              buttonText: 'Debit Card',
              textColor: Colors.grey[600],
              context: context
            ),
            _buildRaisedButton(
              buttonColor: Colors.grey[100],
              buttonText: 'Gift Card',
              textColor: Colors.grey[600],
              context: context
            ),
            _buildTextInfo
          ],
        ),
      ),
    );
  }

  Widget _buildRaisedButton({
    Color buttonColor,
    String buttonText,
    Color textColor,
    BuildContext context
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: RaisedButton(
        elevation: 1.0,
        onPressed: () {
          // accion al presionar
        },
        color: buttonColor,
        child: Text(
          buttonText,
          style: TextStyle(
            color:textColor
          ),
        ),
      ),
    );
  }
}