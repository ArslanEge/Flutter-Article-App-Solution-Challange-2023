import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/home.dart';
import 'package:flutter_application_2/views/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

void main() {
  runApp(const ProviderScope (child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey:Grock.navigationKey,
      scaffoldMessengerKey:Grock.scaffoldMessengerKey,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:Login(),
    );
  }
}


