import 'dart:io';

import 'package:bisonabiso/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EtudiantController {
  Future<String> enregistrerEtudiant(
      String matricule,
      String nom,
      String prenom,
      String promotion,
      String adresse,
      String contact,
      String mail,
      String date,
      File file) async {
    String reponse = "";
    try {
      await uploadFicier(nom, file);
      await firestore.collection("Etudiants").doc(matricule).set({
        "matricule": matricule,
        "nom": nom,
        "prenom": prenom,
        "promotion": promotion,
        "adresse": adresse,
        "contact": contact,
        "mail": mail,
        "date": date
      });
      reponse = "Reussie";
    } catch (e) {
      reponse = e.toString();
    }
    return reponse;
  }

  uploadFicier(String nom, File file) async {
    Reference ref = firebaseStorage.ref().child("Etudiants").child(nom);
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
  }
}
