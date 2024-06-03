import 'package:bisonabiso/utils/utils.dart';

class EtudiantController {
  Future<String> enregistrerEtudiant(
      String matricule,
      String nom,
      String prenom,
      String promotion,
      String adresse,
      String contact,
      String mail,
      String date) async {
    String reponse = "";
    try {
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
}
