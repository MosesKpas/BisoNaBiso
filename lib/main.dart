import 'package:bisonabiso/api/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:bisonabiso/ui/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Notification
  //await FirebaseApi.initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue)),
      home: const LoginPage(),
    );
  }
}
