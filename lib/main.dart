import 'package:flutter/material.dart';
import 'package:tv_service/modules/auth/login.dart';
import 'package:tv_service/services/db_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DbService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
