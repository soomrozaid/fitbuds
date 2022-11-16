import 'package:flutter/material.dart';

class FitButton extends StatelessWidget {
  final double padding;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;
  final void Function()? onPressed;
  final Widget? child;
  final bool isTextButton;

  const FitButton({
    Key? key,
    this.padding = 8,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w200,
    this.text = 'fit button',
    required this.onPressed,
    this.isTextButton = false,
    this.child,
  }) : super(key: key);

  factory FitButton.text({
    Key? key,
    padding = 8,
    fontSize = 24,
    fontWeight = FontWeight.w200,
    text = 'fit button',
    required onPressed,
    child,
  }) =>
      FitButton(
        onPressed: onPressed,
        text: text,
        isTextButton: true,
      );

  ButtonStyleButton get getButton => isTextButton
      ? TextButton(onPressed: onPressed, child: Text(text))
      : ElevatedButton(
          child: Text(text),
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 36, vertical: 12)),
            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
            )),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(255, 87, 87, 1.0)),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(padding), child: child ?? getButton);
  }
}
