import 'dart:io';

import 'package:bisonabiso/utils/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EnseigantController {
  //Recuperer le path de l'image
  Reference? ref;
  Future<String> enregisstrerEnseignant(
    String matricule,
    String nom,
    String prenom,
    String specialite,
    String contact,
    String mail,
    File file,
  ) async {
    String reponse = "";
    try {
      await uploadFichier(nom, file);
      //Recuperer l'url de l'image
      String imageUrl = await ref!.getDownloadURL();

      await firestore.collection("enseignant").doc(matricule).set({
        "matricule": matricule,
        "nom": nom,
        "prenom": prenom,
        "specialite": specialite,
        "contact": contact,
        "mail": mail,
        "imageUrl": imageUrl,
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
    ref = firebaseStorage.ref().child("photoEnseignant").child(nom);
    UploadTask uploadtask = ref!.putFile(file);
    TaskSnapshot snapshot = await uploadtask;
  }
}
