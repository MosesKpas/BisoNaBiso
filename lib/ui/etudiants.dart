import 'package:bisonabiso/model/etudiant.dart';
import 'package:bisonabiso/ui/chargement.dart';
import 'package:bisonabiso/ui/erreurpage.dart';
import 'package:bisonabiso/ui/etudiant.dart';
import 'package:bisonabiso/ui/etudiantdetail.dart';
import 'package:bisonabiso/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EtudiantsPage extends StatelessWidget {
  const EtudiantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestore.collection("Etudiants").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const ErreurPage();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ChargementPage();
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text("Etudiants"),
            ),
            body: ListView(
              children: snapshot.data!.docs.map((document) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Etudiant et = Etudiant(
                        matricule: document["matricule"],
                        nom: document["nom"],
                        prenom: document["prenom"],
                        promotion: document["promotion"],
                        adresse: document["adresse"],
                        contact: document["contact"],
                        mail: document["mail"],
                        date: document["date"],
                        imageUrl: document["imageUrl"],
                      );
                      Navigator.push(
                          //creer un objet enseignant
                          context,
                          MaterialPageRoute(
                              builder: (context) => EtudiantDetailPage(
                                    etudiant: et,
                                  )));
                    },
                    title: Text(document['nom'] + " " + document['prenom']),
                    subtitle: Text(document['matricule']),
                  ),
                );
              }).toList(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EtudiantPage()));
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
