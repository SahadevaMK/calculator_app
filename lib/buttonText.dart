import 'package:flutter/material.dart';

class buttonText extends StatelessWidget {
  final  color;
  final String textButton;
  final  textColor;
  final buttonTapped;
   buttonText({Key? key, required this.color, required this.textButton, required this.textColor, this.buttonTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            // height: 10,
            color: color,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
