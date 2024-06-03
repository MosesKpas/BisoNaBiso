import 'package:bisonabiso/ui/enseignants.dart';
import 'package:bisonabiso/ui/etudiants.dart';
import 'package:bisonabiso/ui/login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bino na bisso"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Theme.of(context).primaryColor])),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/upc.jpg"),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            const Divider(
              height: 5,
              color: Colors.blue,
            ),
            ListTile(
              //leading: const Icon(Icons.abc),
              leading:
                  const Icon(Icons.accessibility_sharp, color: Colors.blue),
              trailing: const Icon(Icons.arrow_forward, color: Colors.blue),
              title: const Text("Nos enseignants"),
              onTap: () {
                //fermeture menu
                Navigator.of(context).pop();
                //Navigation nvlle page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnseigantPage()));
              },
            ),
            const Divider(
              height: 5,
              color: Colors.blue,
            ),
            ListTile(
              leading: const Icon(Icons.accessibility_sharp),
              title: const Text("Mes collegues"),
              onTap: () {
                //fermeture menu
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EtudiantsPage()));
              },
            ),
            const Divider(
              height: 5,
              color: Colors.blue,
            ),
            ListTile(
              leading: const Icon(Icons.back_hand),
              title: const Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
            const Divider(
              height: 5,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Bienvenue"),
      ),
    );
  }
}
