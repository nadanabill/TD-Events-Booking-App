import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class DefaultTextFormFieldWidget extends StatefulWidget {
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  bool isObscureText;
  bool? isPassword;
  final String icon;
  final String hintText;

  DefaultTextFormFieldWidget(
      {super.key,
      required this.controller,
      this.textInputType = TextInputType.text,
      this.validator,
      this.isObscureText = false,
      this.onFieldSubmitted,
      this.isPassword,
      required this.icon,
      required this.hintText});

  @override
  State<DefaultTextFormFieldWidget> createState() =>
      _DefaultTextFormFieldWidgetState();
}

class _DefaultTextFormFieldWidgetState
    extends State<DefaultTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      obscureText: widget.isObscureText,
      decoration: InputDecoration(
        hintStyle: AppTextStyles.font14LightGray400,
        suffixIcon: widget.isPassword != null
            ? IconButton(
                icon: Icon(
                  widget.isObscureText
                      ? Icons.visibility_off_sharp
                      : Icons.visibility_outlined,
                  color: const Color(0xff9c9d9f),
                ),
                onPressed: () {
                  widget.isObscureText = !widget.isObscureText;
                  setState(() {});
                },
              )
            : null,
        prefixIcon: Image.asset(
          widget.icon,
          height: 22,
          width: 22,
        ),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffE4DFDF)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffE4DFDF)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Color(0xffE4DFDF)),
        ),
      ),
    );
  }
}
