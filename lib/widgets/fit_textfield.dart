import 'package:flutter/material.dart';

class FitTextField extends StatelessWidget {
  final double padding;
  final double verticalPadding;
  final double horizontalPadding;
  final EdgeInsets? paddingEdgeInsets;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final IconData? prefixIconData;
  final VoidCallback? onTogglePasswordVisibility;
  const FitTextField({
    Key? key,
    this.padding = 8,
    this.verticalPadding = 8,
    this.horizontalPadding = 24,
    this.paddingEdgeInsets,
    this.controller,
    this.onChanged,
    this.hintText = 'Hint Text',
    this.errorText,
    this.focusNode,
    this.obscureText,
    this.prefixIconData,
    this.onTogglePasswordVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      // ?? EdgeInsets.all(padding),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText ?? hintText.toLowerCase() == 'password',
        autocorrect: false,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            prefixIcon: Icon(
              prefixIconData,
              color: Colors.grey,
            ),
            suffixIcon: hintText.toLowerCase() == 'password'
                ? IconButton(
                    icon: Icon(
                      obscureText == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: onTogglePasswordVisibility,
                  )
                : null,
            hintText: hintText,
            labelText: hintText,
            hintStyle: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w200, color: Colors.grey),
            contentPadding: const EdgeInsets.all(12),
            errorText: errorText),
      ),
    );
  }
}
