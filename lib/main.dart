import 'package:flutter_assessment/screens/home_screen/home_screen_shimmer.dart';

import '../../../providers/user_account_provider.dart';
import '../../../screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>ApiDataProvider())
    ],
    child:
      const MyApp(),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expert gateway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    );
  }
}
