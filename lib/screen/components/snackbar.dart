import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

var registSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  width: double.infinity,
  content: AwesomeSnackbarContent(
    title: 'Success!',
    color: AppColors.primaryBrand,
    message: 'Please complete your registration here!',
    contentType: ContentType.success,
  ),
);

var registSuccessSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  width: double.infinity,
  content: AwesomeSnackbarContent(
    title: 'Success!',
    color: AppColors.primaryBrand,
    message: 'Your registration is complete!',
    contentType: ContentType.success,
  ),
);

var postSuccessSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  width: double.infinity,
  content: AwesomeSnackbarContent(
    title: 'Success!',
    color: AppColors.primaryBrand,
    message: 'Your forum has been posted!',
    contentType: ContentType.success,
  ),
);

var registFailedSnackBar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  width: double.infinity,
  content: AwesomeSnackbarContent(
    title: 'Opps!',
    color: AppColors.primaryBrand,
    message: 'Something went wrong, please try again later!',
    contentType: ContentType.failure,
  ),
);
