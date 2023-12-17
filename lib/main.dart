import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivacity_app/Home/home.dart';
import 'package:vivacity_app/Splash/splash.dart';
import 'package:vivacity_app/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const VivaApp());
}

class VivaApp extends StatelessWidget {
  const VivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      //scrollBehavior: MaterialScrollBehavior(),
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
        'app': (_) => const Navigation(),
        'splash': (_) => const Splash(),
        'home': (_) => const Home(),
      },
      initialRoute: 'splash',
    );
  }
}
