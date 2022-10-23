import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    Key? key,
    required this.text,
    required this.onClickFunction,
    required this.isDisable,
  }) : super(key: key);

  final String text;
  final Function() onClickFunction;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisable ? null : onClickFunction,
      style: TextButton.styleFrom(
          backgroundColor:
              isDisable ? const Color(0xffE5E5E5) : AppColors.primaryBrand,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.w))),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
