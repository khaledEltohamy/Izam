import 'dart:ui';

extension ColorApp on Color {
  //BASE
  static Color get white => HexColor.fromHex('#FFFFFF');
  static Color get black => HexColor.fromHex('#213242');

  //GRY
  static Color gryShadow(double opacity) =>
      HexColor.fromHex('#707070').withOpacity(opacity);
  static Color gryBackground(double opacity) =>
      HexColor.fromHex('#F4F4F6').withOpacity(opacity);

  //?-1 GRY TEXT FIELD
  static Color gryBackgroundTextField(double opacity) =>
      HexColor.fromHex('#F4F4F6').withOpacity(opacity);
  static Color gryHintTextField(double opacity) =>
      HexColor.fromHex('#75799D').withOpacity(opacity);

  // Blue
  static Color blueButton(double opacity) =>
      HexColor.fromHex('#1877F2').withOpacity(opacity);
}

//Extension for converting hex color string to color
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    //Adding FF to the beginning of the string
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
