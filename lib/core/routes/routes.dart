import 'package:flutter/material.dart';
import 'package:hiero_company/core/constants/enums.dart';

class NavigationHandler {
  static void navigateTo(BuildContext context, Widget screen) =>
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => screen),
      );

  static void navigateOff(BuildContext context, Widget screen) =>
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );

  static void navigateKill(BuildContext context, Widget screen) =>
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (route) => false,
      );

  static void pop(BuildContext context,
      {ScreenPopCount screenPopCount = ScreenPopCount.one}) {
    int pops = screenPopCount.index + 1;
    Navigator.of(context).popUntil((route) => pops-- <= 0);
  }

  static void navigateWithAnimation(
    BuildContext context,
    Widget screen,
    SlideDirection slideDirection, {
    bool killThePreviousPage = false,
  }) {
    const transitionDuration = Duration(milliseconds: 500);

    if (killThePreviousPage) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          transitionDuration: transitionDuration,
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset begin;
            switch (slideDirection) {
              case SlideDirection.slideRight:
                begin = const Offset(-1.0, 0.0);
                break;
              case SlideDirection.slideUp:
                begin = const Offset(0.0, 1.0);
                break;
              case SlideDirection.slideLeft:
                begin = const Offset(1.0, 0.0);
                break;
              case SlideDirection.slideDown:
                begin = const Offset(0.0, -1.0);
                break;
            }
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
        (route) => false,
      );
    } else {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: transitionDuration,
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset begin;
            switch (slideDirection) {
              case SlideDirection.slideRight:
                begin = const Offset(-1.0, 0.0);
                break;
              case SlideDirection.slideUp:
                begin = const Offset(0.0, 1.0);
                break;
              case SlideDirection.slideLeft:
                begin = const Offset(1.0, 0.0);
                break;
              case SlideDirection.slideDown:
                begin = const Offset(0.0, 1.0);
                break;
            }
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      );
    }
  }
}
