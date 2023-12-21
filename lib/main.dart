import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivacity_app/Bar/bar.dart';
import 'package:vivacity_app/Eventos/eventos.dart';
import 'package:vivacity_app/Favoritos/Favoritos.dart';
import 'package:vivacity_app/Home/Home.dart';
import 'package:vivacity_app/Hospedaje/hospedaje.dart';
import 'package:vivacity_app/Lugares/lugares.dart';
import 'package:vivacity_app/Mapa/Mapa.dart';
import 'package:vivacity_app/Perfil/Perfil.dart';
import 'package:vivacity_app/RV/virtual.dart';
import 'package:vivacity_app/Restaurantes/restaurantes.dart';
import 'package:vivacity_app/Shopping/shopping.dart';
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
      home: const Navigation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF48448C),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.dmSansTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.dmSans(
                textStyle: textTheme.bodyLarge,
                decoration: TextDecoration.none)),
      ),
      routes: {
        'splash': (_) => const Splash(),
        'navigationHome': (_) => const Navigation(),
        'home': (context) => const Home(),
        'mapa': (context) => const Mapa(),
        'favoritos': (context) => const Favoritos(),
        'perfil': (context) => const Perfil(),
        'virtual': (_) => const Virtual(),
        'restaurantes': (_) => const Restaurantes(),
        'lugares': (_) => const Lugares(),
        'hospedaje': (_) => const Hospedaje(),
        'eventos': (_) => const Eventos(),
        'shopping': (_) => const Shopping(),
        'bar': (_) => const Bar(),
      },
      initialRoute: 'splash',
    );
  }
}
