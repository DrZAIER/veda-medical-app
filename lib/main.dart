
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:veda_app/l10n/app_localizations.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const VedaApp());
}

class VedaApp extends StatelessWidget {
  const VedaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VEDA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Apply the new Amazing Theme
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
        Locale('es'), // Spanish
      ],
      home: const HomeScreen(),
    );
  }
}
