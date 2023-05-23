import 'package:flutter/material.dart';
import 'package:zotfeast/config/color_constants.dart';

final textInputDecoration = InputDecoration(
  fillColor: ColorConstants.zotfeastBrownLight,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide:
        BorderSide(color: ColorConstants.zotfeastBrownLight, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: ColorConstants.zotfeastGreen, width: 2.0),
  ),
);
