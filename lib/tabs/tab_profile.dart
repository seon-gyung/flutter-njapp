// tabs/tab_profile.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/model_auth.dart';

class TapProfile extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Profile"),
          LoginOutButton(),
        ],
      ),
    );
  }
}

class LoginOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authClient =
    Provider.of<FirebaseAuthProvider>(context, listen: false);
    return TextButton(
        onPressed: () async {
          await authClient.logout();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('logout!')));
          Navigator.of(context).pushReplacementNamed('/login');
        },
        child: Text('logout'));
  }
}