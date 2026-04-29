import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'controller/dolor_controller.dart';
import 'view/dolor_list_page.dart';
import 'view/splash_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DolorController())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alivia Dolores',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF6D5BFF),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white.withOpacity(0.85),
          elevation: 8,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xFF2D2D2D),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const DolorListPage(),
      },
    );
  }
}
