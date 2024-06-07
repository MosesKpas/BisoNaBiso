import 'package:bisonabiso/model/enseignant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EnseignantDetailPage extends StatelessWidget {
  final Enseignant enseignant;
  const EnseignantDetailPage({super.key, required this.enseignant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Info profs"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: enseignant.imageUrl!.isEmpty
                    ? const Image(
                        image: AssetImage("assets/images/defaultUser.jpg"),
                      )
                    : Image(
                        image: NetworkImage(enseignant.imageUrl!),
                      ),
              ),
              const Divider(
                height: 50,
                color: Colors.blue,
              ),
              Text(
                "Matricule : ${enseignant.matricule.toString()}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.bold),
              ),
              Text("nom : ${enseignant.nom.toString()}"),
              Text("prenom : ${enseignant.prenom.toString()}"),
              Text("specialite : ${enseignant.specialite.toString()}"),
              GestureDetector(
                  onTap: () {
                    lancer("tel:${enseignant.contact.toString()}");
                  },
                  child: Text("contact : ${enseignant.contact.toString()}")),
              GestureDetector(
                  onTap: () {
                    lancer("mailto:${enseignant.mail.toString().toString()}");
                  },
                  child: Text("Mail :${enseignant.mail.toString()}"))
            ],
          ),
        ));
  }

  void lancer(String num) async {
    // ignore: deprecated_member_use
    if (!await launch(num)) throw '';
  }
}
