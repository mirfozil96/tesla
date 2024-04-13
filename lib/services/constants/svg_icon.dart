import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

sealed class SvgIcon {
  static SvgPicture arrow = SvgPicture.asset("assets/icons/arrow.svg");
  static SvgPicture shield = SvgPicture.asset("assets/icons/shield.svg");
  static SvgPicture car_1 = SvgPicture.asset("assets/icons/svg_car_1.svg");
  static SvgPicture charge = SvgPicture.asset("assets/icons/svg_charge.svg");
  static SvgPicture chevronRight =
      SvgPicture.asset("assets/icons/svg_chevron_right.svg");
  static SvgPicture lock = SvgPicture.asset("assets/icons/svg_lock.svg");
  static SvgPicture locationCharge =
      SvgPicture.asset("assets/icons/svg_location_charge.svg");
  static SvgPicture lockGreen =
      SvgPicture.asset("assets/icons/svg_lock_green.svg");
  static SvgPicture person = SvgPicture.asset("assets/icons/svg_person.svg");
  static SvgPicture settings =
      SvgPicture.asset("assets/icons/svg_settings.svg");
  static SvgPicture circular = SvgPicture.asset("assets/icons/circular.svg");
  static SvgPicture snow = SvgPicture.asset("assets/icons/svg_snow.svg");
  static SvgPicture sun = SvgPicture.asset("assets/icons/sun.svg");
  static SvgPicture control = SvgPicture.asset("assets/icons/control.svg");
  static SvgPicture chaqmoq = SvgPicture.asset("assets/icons/chaqmoq.svg");
  static SvgPicture unlock = SvgPicture.asset("assets/icons/svg_unlock.svg");
  static SvgPicture vent = SvgPicture.asset("assets/icons/svg_vent.svg");
}

extension ExtSvgPicture on SvgPicture {
  SvgPicture copyWith({double? newWidth, double? newHeight, Color? newColor}) {
    return SvgPicture(
      bytesLoader,
      width: newHeight ?? width,
      height: newHeight ?? height,
      colorFilter: newColor != null
          ? ColorFilter.mode(newColor, BlendMode.srcIn)
          : colorFilter,
    );
  }
}
