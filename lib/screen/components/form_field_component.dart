import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/app_colors.dart';

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent(
      {Key? key,
      required this.name,
      required this.placeholder,
      required this.validation,
      required this.controller,
      required this.isDisable,
      this.initialValue,
      this.height})
      : super(key: key);

  final String name;
  final String placeholder;
  final Function() validation;
  final bool isDisable;
  final TextEditingController controller;
  final String? initialValue;
  final int? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          maxLines: height,
          style: TextStyle(
            color: isDisable ? AppColors.gray3 : AppColors.darkColor,
            fontFamily: "Poppins",
          ),
          enabled: !isDisable,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (value.length < 4) {
              return 'Text must have more than 4 character length';
            }
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: 14.sp,
            ),
            prefix: Padding(padding: EdgeInsets.only(left: 16.w)),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            fillColor: const Color(0xffFFFFFF),
            filled: true,
            hintText: placeholder,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryBrand, width: 1.0),
            ),
            hintStyle: TextStyle(color: AppColors.gray4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
