import 'package:demo_app/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final Function(String)? onchanged;
  final bool isPassword;
  final int maxLines;
  final TextInputType keyboardType;

  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.label,
      required this.controller,
      required this.validator,
      this.onchanged,
      this.isPassword = false,
      this.maxLines = 1,
      this.keyboardType = TextInputType.text});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool showPassword = true;

  toogleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16, color: AppColors.secondary),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.primary,
          // maxLength: maxLength,
          maxLines: widget.maxLines,
          onChanged: widget.onchanged,
          validator: widget.validator,
          obscureText: widget.isPassword ? showPassword : false,
          obscuringCharacter: '*',
          keyboardType: widget.keyboardType,
          style: const TextStyle(fontSize: 15, color: Colors.grey),
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: border,
              enabledBorder: border,
              focusedBorder: border),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  InputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary));
}
