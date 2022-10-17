import 'package:flutter/material.dart';

import '../../utils/constant/app_colors.dart';

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent(
      {Key? key,
      required this.name,
      required this.placeholder,
      required this.controller,
      required this.validation,
      required this.isDisable})
      : super(key: key);

  final String name;
  final String placeholder;
  final TextEditingController controller;
  final Function() validation;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          enabled: !isDisable,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            fillColor: const Color(0xffFFFFFF),
            filled: true,
            hintText: placeholder,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryBrand, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
