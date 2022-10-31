import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        size: 65.h,
        fontSize: 12.sp,
        title: '',
        isHomepage: true,
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
