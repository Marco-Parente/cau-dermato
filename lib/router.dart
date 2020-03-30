import 'package:cau_dermato/UI/screens/content_page.dart';
import 'package:cau_dermato/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case ContentPage.routeName:
      ContentPageArguments args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ContentPage(
                arguments: args,
              ));
    default:
      return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}
