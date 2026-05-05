import 'package:flutter/material.dart';
import 'package:frontend/page/home_page.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lester M. | Front-End Developer',
      themeMode: _themeMode,

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        cardColor: const Color.fromARGB(20, 0, 0, 0),
      ),

      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color.fromARGB(15, 255, 255, 255),
      ),

      home: HomePage(
        onToggleTheme: toggleTheme,
        isDark: _themeMode == ThemeMode.dark,
      ),
    );
  }
}
