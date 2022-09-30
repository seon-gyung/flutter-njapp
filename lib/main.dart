// main.dart

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:njapp/models/model_auth.dart';
import 'package:njapp/screens/screen_index.dart';
import 'package:njapp/screens/screen_login.dart';
import 'package:njapp/screens/screen_splash.dart';
import 'package:provider/provider.dart';

import 'models/model_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'NJ',
        routes: {
          '/index': (context) => IndexScreen(),
          '/login': (context) => LoginScreen(),
          '/splash': (context) => SplashScreen(),
        },
        initialRoute: '/splash',
      ),
    );
  }
}
