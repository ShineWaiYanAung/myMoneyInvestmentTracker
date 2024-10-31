import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final bool isColorChange;
  final String currencyName;
  const BackButtonWidget({
    super.key,
    required this.isColorChange,
    required this.currencyName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Image.asset(isColorChange ? "asset/backButton/backButtonCurrency.png" : "asset/backButton/backButtonType.png")),
        Text(
          currencyName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontFamily: "Jersey"),
        ),
      ],
    );
  }
}