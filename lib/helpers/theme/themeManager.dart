import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'storageManager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    accentColor: Colors.white,
    fontFamily: 'Roboto',
    backgroundColor: const Color(0xFF212121),
    disabledColor: Colors.purple[300],
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
      headline2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
      headline3: TextStyle(fontSize: 17.0, fontWeight: FontWeight.normal),
      headline4: TextStyle(fontSize: 19.0, fontWeight: FontWeight.normal),
      headline5: TextStyle(fontSize: 21.0, fontWeight: FontWeight.normal),
      headline6: TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );

  final lightTheme = ThemeData(
    // primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Color(0xFFF8F8F8),
    primaryColor: const Color(0xFF1DA1F2),
    secondaryHeaderColor: Color(0xFF709489),
    brightness: Brightness.light,
    hintColor: Color(0xffafafaf),
    fontFamily: 'Montserrat',

    backgroundColor: Colors.white,

    dividerColor: Colors.white54,
    disabledColor: Colors.purple[300],
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
      ),
      headline2: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          color: Color(0xff434343)),
      headline3: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
