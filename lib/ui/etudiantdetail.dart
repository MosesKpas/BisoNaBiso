import 'package:bisonabiso/model/etudiant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EtudiantDetailPage extends StatelessWidget {
  final Etudiant etudiant;
  const EtudiantDetailPage({super.key, required this.etudiant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infos Etudiants"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: etudiant.imageUrl!.isEmpty
                    ? const Image(
                        image: AssetImage("assets/images/defaultUser.jpg"),
                      )
                    : Image(
                        image: NetworkImage(etudiant.imageUrl!),
                      ),
              ),
            const Divider(
              height: 50,
              color: Colors.blue,
            ),
            Text(
              "Matricule : ${etudiant.matricule.toString()}",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold),
            ),
            Text("nom : ${etudiant.nom.toString()}"),
            Text("prenom : ${etudiant.prenom.toString()}"),
            Text("promotion : ${etudiant.promotion.toString()}"),
            GestureDetector(
                onTap: () {
                  lancer("tel:${etudiant.contact.toString()}");
                },
                child: Text("contact : ${etudiant.contact.toString()}")),
            GestureDetector(
              onTap: () {
                lancer("mailto:${etudiant.mail.toString().toString()}");
              },
              child: Text("Mail :${etudiant.mail.toString()}"),
            ),
          ],
        ),
      ),
    );
  }

  void lancer(String num) async {
    // ignore: deprecated_member_use
    if (!await launch(num)) throw '';
  }
}
