import 'package:flutter/material.dart';

class ChargementPage extends StatelessWidget {
  const ChargementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(),
          Text(
            "Patientez",
            style: TextStyle(color: Colors.blue),
          )
        ]),
      ),
    );
  }
}
