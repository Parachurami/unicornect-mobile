import 'dart:ui';

class Helper{
  static Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  static bool validName(String name){
    final nameRegExp = RegExp(r"^[a-zA-Z]+(?:[\s'-][a-zA-Z]+)*$");
    return nameRegExp.hasMatch(name);
  }

  static bool validEmail(String email){
    final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegExp.hasMatch(email);
  }
}