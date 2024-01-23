import 'package:flutter/material.dart';
import 'package:jawnnypoo/home_page.dart';
import 'package:jawnnypoo/portfolio_page.dart';
import 'package:jawnnypoo/ui/custom_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'John Carlson',
      theme: ThemeData(
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColors.primaryColor(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/portfolio': (context) => const PortfolioPage(),
      },
    );
  }
}
