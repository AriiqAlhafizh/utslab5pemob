import 'package:flutter/material.dart';
import 'package:utslab5pemob/Config/routes.dart';
import 'package:provider/provider.dart';
import '../Provider/app_state_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppStateProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // Ganti MaterialApp dengan MaterialApp.router
        title: 'Quiz App Baru',

        // Kunci utama: Tunjuk ke konfigurasi router yang telah dibuat
        routerConfig: createRouter(),
    );
  }
}