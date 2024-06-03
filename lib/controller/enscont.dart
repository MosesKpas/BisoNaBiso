import 'dart:io';

import 'package:bisonabiso/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EnseigantController {
  Future<String> enregisstrerEnseignant(
      String matricule,
      String nom,
      String prenom,
      String specialite,
      String contact,
      String mail,
      File file) async {
    String reponse = "";
    try {
      await uploadFichier(nom, file);
      await firestore.collection("enseignant").doc(matricule).set({
        "matricule": matricule,
        "nom": nom,
        "prenom": prenom,
        "specialite": specialite,
        "contact": contact,
        "mail": mail,
      });
      //message ok
      reponse = "Reussie";
    } catch (e) {
      //message err.
      reponse = e.toString();
    }
    return reponse;
  } //fin methode enregistrer

  uploadFichier(String nom, File file) async {
    Reference ref = firebaseStorage.ref().child("Prof").child(nom);
    UploadTask uploadtask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadtask;
  }
}
