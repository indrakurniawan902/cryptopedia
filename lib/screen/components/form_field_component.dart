import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/constant/app_colors.dart';

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent(
      {Key? key,
      this.name,
      this.isSearchBar = false,
      this.placeholder,
      this.validation,
      this.controller,
      required this.isDisable,
      this.initialValue,
      this.changeHandler,
      this.maxLines = 1,
      this.height})
      : super(key: key);
  final bool? isSearchBar;
  final String? name;
  final String? placeholder;
  final Function()? validation;
  final void Function(String)? changeHandler;
  final bool isDisable;
  final TextEditingController? controller;
  final String? initialValue;
  final int? height;
  final int? maxLines;

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
            initialValue: initialValue,
            enabled: !isDisable,
            controller: controller,
            onChanged: changeHandler,
            maxLines: maxLines,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              } else if (value.length < 4) {
                return 'Text must have more than 4 character length';
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: isSearchBar == true
                  ? const Icon(
                      FeatherIcons.search,
                      size: 18,
                    )
                  : null,
              errorStyle: TextStyle(
                fontSize: 14.sp,
              ),
              prefix: Padding(padding: EdgeInsets.only(left: 16.w)),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              fillColor: value.themeValue == false
                  ? AppColors.lightColor
                  : AppColors.gray2,
              filled: true,
              hintText: placeholder,
              hintStyle: TextStyle(
                color: value.themeValue == false
                    ? AppColors.gray4
                    : AppColors.gray4,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryBrand, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: isSearchBar!
                        ? Colors.transparent
                        : value.themeValue == false
                            ? AppColors.gray4
                            : AppColors.darkModeFrame,
                    width: 1.0),
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
