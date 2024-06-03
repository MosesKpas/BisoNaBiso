import 'package:flutter/material.dart';

class ErreurPage extends StatelessWidget {
  const ErreurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Erreur",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
