import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_colors.dart';

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent(
      {Key? key,
      this.name,
      this.placeholder,
      this.validation,
      required this.controller,
      required this.isDisable,
      this.initialValue})
      : super(key: key);

  final String? name;
  final String? placeholder;
  final Function()? validation;
  final bool isDisable;
  final TextEditingController controller;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name!),
        SizedBox(
          height: 8.h,
        ),
        Consumer<ThemeProvider>(
          builder: (context, value, child) => TextFormField(
            enabled: !isDisable,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(
                fontSize: 14.sp,
              ),
              prefix: Padding(padding: EdgeInsets.only(left: 16.w)),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              fillColor: value.themeValue == false
                  ? AppColors.lightColor
                  : AppColors.gray4,
              filled: true,
              hintText: placeholder,
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryBrand, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
