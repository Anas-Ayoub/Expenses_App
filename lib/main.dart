import 'package:expense_tracker/Widget/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';



var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 193, 92, 252),
);

var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 212, 0, 255),
);
void main() {

  // To Fix Portrait Mode 
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {

     runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkScheme,
        cardTheme: CardTheme().copyWith(
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 5,
          color: kDarkScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkScheme.primaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 5,
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
      ),
      home: const Expenses(),
      themeMode: ThemeMode.system, //by default set to Sytem
    ),
  );
  // }); //Fix Portrait Mode
 
}
