import 'package:flutter/material.dart';
import 'package:flutter_splash_homework/feature/login/view/login_view.dart';
import 'package:flutter_splash_homework/product/companents/text/app_text_const.dart';
import 'package:kartal/kartal.dart';
import 'package:flutter_splash_homework/feature/onboard/onboard_model.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _buildViewPageViewController(),
            ),
          ],
        ),
      ),
    );
  }

  _buildViewPageViewController() {
    return PageView.builder(
      controller: _controller,
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      itemBuilder: (context, i) {
        return Column(
          children: [
            Expanded(
              child: _buildMain(i, context),
            ),
          ],
        );
      },
    );
  }

  _buildMain(int i, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: Image.asset(models[i].image, fit: BoxFit.cover)),
        _buildContainer(i, context),
      ],
    );
  }

  Container _buildContainer(int i, BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(0.5),
      decoration: BoxDecoration(
        color: context.appTheme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navigationItemRows(),
            Text(
              models[i].title,
              textAlign: TextAlign.center,
              style: context.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              models[i].description,
              style: context.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: context.verticalPaddingLow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buttonRow(AppString().buttonSkip.toString(),
                      context.appTheme.backgroundColor),
                  const SizedBox(
                    width: 4,
                  ),
                  _buttonRow(AppString().buttonNext.toString(),
                      context.appTheme.colorScheme.secondary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buttonRow(String name, Color color) {
    return SizedBox(
      width: context.dynamicWidth(0.35),
      height: context.dynamicHeight(0.05),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: () {
          if (name == "Skip") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );
          } else {
            if (_currentIndex == models.length - 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            } else {
              _controller?.nextPage(
                  duration: context.durationSlow, curve: Curves.fastOutSlowIn);
            }
          }
        },
        child: Text(name),
      ),
    );
  }

  _navigationItemRows() {
    return Container(
      width: 120,
      height: 14,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            List.generate(models.length, (index) => _buildItemsPage(index)),
      ),
    );
  }

  _buildItemsPage(int index) {
    return CircleAvatar(
      foregroundColor: context.appTheme.primaryColor,
      backgroundColor: _currentIndex == index
          ? context.appTheme.colorScheme.secondary
          : context.appTheme.backgroundColor,
    );
  }
}
