import 'package:auth_app_firebase/pages/authentication_wrapper.dart';
import 'package:auth_app_firebase/services/authentication_service.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> mail() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChange,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'Fultter demo',
        theme: ThemeData(
            primaryColor: Colors.blueAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}
