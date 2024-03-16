import 'package:flutter/material.dart';
import 'package:google_gemini_example/providers/gemini_provider.dart';
import 'package:google_gemini_example/providers/media_provider.dart';
import 'package:google_gemini_example/screens/dashboard.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GeminiProvider()),
        ChangeNotifierProvider(create: (context) => MediaProvider()),
      ],
      child: const MaterialApp(
        title: 'Gemini ✨',
        home: DashboardScreen(),
      ),
    );
  }
}
