import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/undraw_Mobile_login.png",
            fit: BoxFit.fill,
          ),
          buildButtonSing(context),
        ],
      ),
    );
  }

  Center buildButtonSing(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.dynamicWidth(0.7),
            height: context.dynamicHeight(0.06),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: context.appTheme.primaryColor,
              ),
              onPressed: () {},
              child: const Text("Sign In"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: context.dynamicWidth(0.7),
            height: context.dynamicHeight(0.06),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: context.appTheme.primaryColor),
              onPressed: () {},
              child: const Text("Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
