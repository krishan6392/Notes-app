import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishan/view/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Please Verify Your Email'),
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you an email verification. Please open it to verify account"),
          const Text(
              "If you haven't received email verification yet, then click below"),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;

                await user?.sendEmailVerification();
              },
              child: const Text('Send Email Verification')),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('Restart'),
          )
        ],
      ),
    );
  }
}
