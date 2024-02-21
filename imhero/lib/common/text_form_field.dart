// import 'dart:html';

import './colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    required this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할때
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        fillColor: INPUT_BG_COLOR,
        // false - 배경색 없음
        // true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}

class LoginTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const LoginTextFormField({
    required this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double app_width = MediaQuery.of(context).size.width;

    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.green,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    );

    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      // cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할때
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 6, 6, 6),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: Color(0xFFABCBC8),
          fontSize: 16.0,
        ),
        fillColor: INPUT_BG_COLOR,
        // false - 배경색 없음
        // true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder,
      ),
    );
  }
}

class SignupTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final TextEditingController? inputcontroller;

  const SignupTextFormField({
    required this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    this.inputcontroller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double app_width = MediaQuery.of(context).size.width;

    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFFCBD2E0),
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    );

    return TextFormField(
      style: const TextStyle(
        color: Color(0xFFACCBC9),
        fontSize: 16.0,
      ),
      // cursorColor: PRIMARY_COLOR,
      // 비밀번호 입력할때
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      controller: inputcontroller,

      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 6, 6, 6),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: Color(0xFFABCBC8),
          fontSize: 16.0,
        ),
        fillColor: INPUT_BG_COLOR,
        // false - 배경색 없음
        // true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder,
      ),
    );
  }
}
