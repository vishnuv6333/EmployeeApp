// ignore: file_names
import 'package:employeeapp/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
      );
  static get titleMediumBluegray300 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
      );
  static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
      static get bodyMediumBluegray40=> theme.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
      );
}
