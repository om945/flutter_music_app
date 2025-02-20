import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/pages/audioplay_url.dart';
import 'package:flutter_application_1/pages/themepage.dart/light_mode.dart';
import 'package:flutter_application_1/pages/themepage.dart/theme_proivder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => PlaylistProvider())
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData, 
      home: Audiopage(),
    );
  }
}