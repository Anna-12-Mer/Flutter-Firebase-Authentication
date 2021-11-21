// ignore: import_of_legacy_library_into_null_safe
import 'package:auth_app_firebase/pages/sign_in_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'home_page.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseUser = context.watch<User>();
    if (_firebaseUser.uid != null) {
      return const HomePage(); 
    }
    return SignInPage();
  }
}
