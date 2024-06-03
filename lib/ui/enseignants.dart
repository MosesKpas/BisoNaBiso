import 'package:bisonabiso/model/enseignant.dart';
import 'package:bisonabiso/ui/chargement.dart';
import 'package:bisonabiso/ui/enseignant.dart';
import 'package:bisonabiso/ui/enseignantdetail.dart';
import 'package:bisonabiso/ui/erreurpage.dart';
import 'package:bisonabiso/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EnseigantPage extends StatelessWidget {
  const EnseigantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestore.collection("enseignant").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const ErreurPage();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ChargementPage();
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text("Nos enseignants"),
            ),
            body: ListView(
              children: snapshot.data!.docs.map((document) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Enseignant ens = Enseignant(
                        matricule: document["matricule"],
                        nom: document["nom"],
                        prenom: document["prenom"],
                        specialite: document["specialite"],
                        contact: document["contact"],
                        mail: document["mail"],
                      );
                      Navigator.push(
                          //creer un objet enseignant
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnseignantDetailPage(
                                    enseignant: ens,
                                  )));
                    },
                    title: Text(document["nom"] + "  " + document["prenom"]),
                    subtitle: Text(document["contact"]),
                  ),
                );
              }).toList(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnseignantPage()));
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
