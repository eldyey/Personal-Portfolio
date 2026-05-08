import 'package:flutter/material.dart';
import 'package:frontend/page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? false;

  runApp(
    Portfolio(initialThemeMode: isDark ? ThemeMode.dark : ThemeMode.light),
  );
}

class Portfolio extends StatefulWidget {
  final ThemeMode initialThemeMode;

  const Portfolio({super.key, required this.initialThemeMode});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.initialThemeMode;
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isDark', isDark);

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
