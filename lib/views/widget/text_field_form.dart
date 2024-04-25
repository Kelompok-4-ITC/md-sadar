import 'package:flutter/material.dart';

class CustomTextVield {
  final TextEditingController _controller = TextEditingController();
  final TextInputAction? _textAction;
  final TextInputType? _textType;
  final Icon? _suffixIcon;
  String? _errorMessage;
  final String? _label;
  final String? _hint;

  CustomTextVield({
    TextInputAction? textAction,
    TextInputType? textType,
    String? errorMessage,
    Icon? suffixIcon,
    String? label,
    String? hint,
  })  : _hint = hint,
        _label = label,
        _errorMessage = errorMessage,
        _suffixIcon = suffixIcon,
        _textAction = textAction,
        _textType = textType;

  TextEditingController get getController => _controller;

  void setErrorMessage(String? errorMessage) => _errorMessage = errorMessage;

  Widget generateNormalWidget({required bool validation}) {
    return TextField(
      controller: _controller,
      textInputAction: _textAction,
      keyboardType: _textType,
      decoration: InputDecoration(
        errorText: validation ? _errorMessage : null,
        border: const OutlineInputBorder(),
        labelText: _label,
        hintText: _hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        suffixIcon: _suffixIcon,
      ),
    );
  }

  Widget generatePasswordWidget({
    required Widget suffixIcon,
    required bool isHide,
    required bool validation,
  }) {
    return TextField(
      controller: _controller,
      textInputAction: _textAction,
      obscureText: isHide,
      decoration: InputDecoration(
        errorText: validation ? _errorMessage : null,
        border: const OutlineInputBorder(),
        labelText: _label,
        hintText: _hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget generateReadOnlyWidget({
    required bool validation,
    required Function() onTap,
  }) {
    return TextField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        errorText: validation ? _errorMessage : null,
        border: const OutlineInputBorder(),
        labelText: _label,
        hintText: _hint,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
        suffixIcon: _suffixIcon,
      ),
      onTap: onTap,
    );
  }
}
