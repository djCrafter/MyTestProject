import 'package:flutter/material.dart';

extension ColorX on Color {
  ColorFilter get toSvgColorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
