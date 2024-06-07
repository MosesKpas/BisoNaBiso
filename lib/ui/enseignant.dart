import 'package:bisonabiso/controller/enscont.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EnseignantPage extends StatefulWidget {
  const EnseignantPage({super.key});

  @override
  State<EnseignantPage> createState() => _EnseignantPageState();
}

class _EnseignantPageState extends State<EnseignantPage> {
  //Creation controlleur de saisie de text
  TextEditingController matriculeController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController specialiteController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  File? _imageFile;
  final _picker = ImagePicker();

  final GlobalKey<ScaffoldState> mykey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mykey,
      appBar: AppBar(
        title: const Text("Identification Enseignant"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              imageProfile(),
              const SizedBox(height: 20),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: matriculeController,
                decoration: const InputDecoration(
                  hintText: "Matricule",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: nomController,
                decoration: const InputDecoration(
                  hintText: "Nom",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                controller: prenomController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Prenom",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: specialiteController,
                decoration: const InputDecoration(
                  hintText: "Specialite",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: contactController,
                decoration: const InputDecoration(
                  hintText: "Contact",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: mailController,
                decoration: const InputDecoration(
                  hintText: "Mail",
                ),
              ),
              //button
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    enregistrer();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choisir une image",
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  prendrePhoto(ImageSource.camera);
                },
                label: const Text("Camera"),
              ),
              TextButton.icon(
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    prendrePhoto(ImageSource.gallery);
                  },
                  label: const Text("Gallerie")),
            ],
          )
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? const AssetImage("assets/images/defaultUser.jpg")
              : Image.file(_imageFile!).image,
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((builder) => bottomSheet()));
            },
            child: const Icon(Icons.add_a_photo,
                color: Color.fromARGB(255, 255, 0, 0), size: 28.0),
          ),
        ),
      ],
    );
  }

  //
  void prendrePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  enregistrer() async {
    if (matriculeController.text.isEmpty) {
      showMessage("Remplir le Matricule");
    } else if (nomController.text.isEmpty) {
      showMessage("Remplir le Nom");
    } else if (prenomController.text.isEmpty) {
      showMessage("Remplir le Prenom");
    } else if (specialiteController.text.isEmpty) {
      showMessage("Remplir la Specialite");
    } else if (contactController.text.isEmpty) {
      showMessage("Remplir le Contact");
    } else if (mailController.text.isEmpty) {
      showMessage("Remplir le Mail");
    } else if (_imageFile == null) {
      showMessage("Veuillez choisir une image");
    } else {
      String matricule = matriculeController.text.toUpperCase();
      String nom = nomController.text.toUpperCase();
      String prenom = prenomController.text.toUpperCase();
      String specialite = specialiteController.text.toUpperCase();
      String contact = contactController.text.toUpperCase();
      String mails = mailController.text;
      EnseigantController ense = EnseigantController();
      var eyano = await ense.enregisstrerEnseignant(
          matricule, nom, prenom, specialite, contact, mails, _imageFile!);
      if (eyano == "Reussie") {
        showMessage("Enseignant enregistrer avec succes");
        reset();
        _imageFile = null;
      } else {
        showMessage("Enseignant non enregistrer $eyano");
      }
    }
  }

  showMessage(String message) {
    final monsnack = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(monsnack);
  }

  reset() {
    matriculeController.clear();
    nomController.clear();
    prenomController.clear();
    specialiteController.clear();
    contactController.clear();
    mailController.clear();
  }
}
