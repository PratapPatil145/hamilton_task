import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'module/login/ui/login_scrren.dart';

late SharedPreferences sharedPrefrence;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefrence = await SharedPreferences.getInstance();
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
