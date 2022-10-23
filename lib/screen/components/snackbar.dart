import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

var registSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  width: double.infinity,
  content: AwesomeSnackbarContent(
    title: 'Succsess!',
    color: AppColors.primaryBrand,
    message: 'Please complete your registration here!',
    contentType: ContentType.success,
  ),
);
