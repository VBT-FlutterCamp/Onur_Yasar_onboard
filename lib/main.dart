import 'package:flutter/material.dart';
import 'package:flutter_splash_homework/feature/login/view/login_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.white70,

          // colorScheme: ColorScheme(primary: Colors.red, primaryVariant: primaryVariant, secondary: secondary, secondaryVariant: secondaryVariant, surface: surface, background: background, error: error, onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
          primaryColor: const Color.fromRGBO(98, 150, 177, 1),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
          primaryColorDark: Colors.black,
          primaryColorLight: Colors.red,
        ),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const LoginView());
  }
}
