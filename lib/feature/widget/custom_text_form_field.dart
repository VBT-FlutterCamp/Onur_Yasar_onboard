import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextFiled extends StatefulWidget {
  const CustomTextFiled(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.hintText,
      this.isPassword = false,
      this.suffixIcon,
      required this.focusNode})
      : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final bool isPassword;

  final IconButton? suffixIcon;
  final FocusNode focusNode;

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Bu alan boş kalmamalı";
          }
          if (value.length < 6) {
            return "6 dan küçük olamaz";
          }
          if (value.length > 20) {
            return "20 den büyük olamaz";
          }

          return null;
        },
        focusNode: widget.focusNode,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          labelStyle: context.textTheme.headline5,
          enabledBorder: OutlineInputBorder(
            borderRadius: context.normalBorderRadius,
            borderSide: BorderSide(
              color: context.appTheme.primaryColorDark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: context.normalBorderRadius,
            borderSide: BorderSide(
              color: context.appTheme.primaryColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: context.normalBorderRadius,
            borderSide: BorderSide(
              color: context.appTheme.primaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
