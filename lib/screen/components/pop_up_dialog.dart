import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUpDialog extends StatelessWidget {
  const PopUpDialog({
    Key? key,
    required this.type,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String type;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${type}_icon.png',
              height: 80.h,
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
            ),
            Text(description),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
