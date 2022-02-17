import 'package:flutter/material.dart';
import 'package:flutter_splash_homework/feature/widget/custom_text_form_field.dart';
import 'package:flutter_splash_homework/product/companents/text/app_text_const.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool sifreGoster = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.dynamicHeight(1),
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    borderOnForeground: true,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: context.lowBorderRadius,
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: context.paddingLow,
                      child: _buildTextAndForm(context),
                    ),
                  ),
                  _accountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildTextAndForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: context.dynamicHeight(0.05),
        ),
        _buildText(context, AppString().welcomeText.toString(),
            context.textTheme.headline5),
        _buildText(
          context,
          AppString().desingText.toString(),
          context.textTheme.headline3?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.appTheme.primaryColorDark,
          ),
        ),
        SizedBox(
          height: context.dynamicHeight(0.08),
        ),
        _buildForm(context),
        _buildForgotPassword(context),
        _buildLoginButton(context),
      ],
    );
  }

  Text _buildText(BuildContext context, String headline, var style) {
    return Text(
      headline,
      style: style,
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextFiled(
              suffixIcon: IconButton(
                  onPressed: () {
                    _informationMailPassword();
                  },
                  icon: const Icon(Icons.info_outline_rounded)),
              controller: _mailController,
              textInputType: TextInputType.emailAddress,
              hintText: AppString().emailText ?? "",
              focusNode: _emailNode),
          SizedBox(height: context.dynamicHeight(0.02)),
          CustomTextFiled(
              controller: _passwordController,
              textInputType: TextInputType.visiblePassword,
              isPassword: sifreGoster ? false : true,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      sifreGoster = !sifreGoster;
                    });
                  },
                  icon: Icon(
                    sifreGoster ? Icons.visibility : Icons.visibility_off,
                  )),
              hintText: AppString().passwordText ?? "",
              focusNode: _passwordNode),
        ],
      ),
    );
  }

  Padding _buildForgotPassword(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: SizedBox(
        width: context.width,
        child: InkWell(
          onTap: () {},
          child: Text(
            AppString().forgotPsw.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }

  _buildLoginButton(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: context.dynamicWidth(0.9),
              height: context.dynamicHeight(0.07),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: context.appTheme.primaryColorLight,
                ),
                onPressed: () {},
                child: Text(
                  AppString().signButton.toString(),
                  style: context.textTheme.headline4?.copyWith(
                    color: context.appTheme.backgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _accountText() {
    return InkWell(
      onTap: () {},
      child: Text.rich(
        TextSpan(text: AppString().accountText.toString(), children: [
          TextSpan(
              text: AppString().createText.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  void _informationMailPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            elevation: 1,
            titleTextStyle: context.textTheme.headline4,
            contentPadding: context.paddingLow,
            title: Text(AppString().warningText.toString()),
            children: [
              SimpleDialogOption(
                child: Text(
                  AppString().infoTextOne.toString(),
                  style: context.textTheme.titleMedium,
                ),
              ),
              SimpleDialogOption(
                child: Text(
                  AppString().infoTextTwo.toString(),
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          );
        });
  }
}
