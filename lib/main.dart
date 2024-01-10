import 'package:flutter/material.dart';
import '../wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Baby Milestones', options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Baby Milestones Tracker',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blue.shade800),
                    foregroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white)))),
        home: StreamProvider<User?>.value(
            value: FirebaseAuth.instance.authStateChanges(),
            initialData: null,
            child: const Wrapper()));
  }
}
