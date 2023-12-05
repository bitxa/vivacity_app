import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivacity_app/Splash/splash.dart';
import 'package:vivacity_app/navigation.dart';

void main() {
  runApp(const VivaApp());
}

class VivaApp extends StatelessWidget {
  const VivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      home: Navigation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.dmSans(
                textStyle: textTheme.bodyLarge,
                decoration: TextDecoration.none)),
      ),
      routes: {
        'app': (_) => const Navigation(),
        'splash': (_) => const Splash()
      },
      initialRoute: 'splash',
    );
  }
}
