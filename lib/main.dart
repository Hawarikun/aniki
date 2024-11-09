import 'package:aniki/core/config/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    const ProviderScope(
      child: AnikiApp(),
    ),
  );
}

class AnikiApp extends StatelessWidget {
  const AnikiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp.router(
      title: "Aniki",
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.urbanistTextTheme(textTheme),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF06C149),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFFFD300),
          onSecondary: Color(0xFF000000),
          error: Color(0xFFB00020),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF000000),
        ),
      ),
      routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
      routeInformationParser: AppRoutes.goRouter.routeInformationParser,
      routerDelegate: AppRoutes.goRouter.routerDelegate,
    );
  }
}
