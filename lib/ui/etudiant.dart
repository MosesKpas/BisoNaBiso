import 'dart:io';
import 'package:bisonabiso/controller/etucont.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EtudiantPage extends StatefulWidget {
  const EtudiantPage({super.key});

  @override
  State<EtudiantPage> createState() => _EtudiantPageState();
}

class _EtudiantPageState extends State<EtudiantPage> {
  TextEditingController matriculeController = TextEditingController();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController promotionController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  //image
  //late PickedFile _imageFile;
  File? _imageFile;
  final _picker = ImagePicker();

  final GlobalKey<ScaffoldState> mykey = GlobalKey();
  bool switchvalue = false;
  DateTime maintenant = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mykey,
      appBar: AppBar(
        title: const Text("Mes collegues"),
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
              const SizedBox(
                height: 20,
              ),
              
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: matriculeController,
                decoration: const InputDecoration(
                  //labelText: "Matricule",
                  hintText: "Matricule",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: nomController,
                decoration: const InputDecoration(
                  hintText: "Nom",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                controller: prenomController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Prenom",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: promotionController,
                decoration: const InputDecoration(
                  hintText: "Promotion",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.text,
                controller: adresseController,
                decoration: const InputDecoration(
                  hintText: "Adresse",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: contactController,
                decoration: const InputDecoration(
                  hintText: "Contact",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: mailController,
                decoration: const InputDecoration(
                  hintText: "Mail",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Genre :"),
                  Switch(
                      value: switchvalue,
                      // ignore: avoid_types_as_parameter_names
                      onChanged: (bool) {
                        setState(() {
                          switchvalue = bool;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: false,
                keyboardType: TextInputType.datetime,
                controller: dateController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month_outlined),
                  //hintText: "Mail",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                onTap: () {
                  showCalendar();
                },
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
                  child: const Text("Save"))
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

  //Creation des methodes
  showCalendar() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1995),
            lastDate: DateTime(2025))
        .then((value) {
      if (value != null) {
        setState(() {
          maintenant = value;
          String datejour = DateFormat.yMMM().format(maintenant);
          dateController.text = datejour;
        });
      }
    });
  }

  enregistrer() async {
    if (matriculeController.text.isEmpty) {
      showMessage("Remplir le Matricule");
    } else if (nomController.text.isEmpty) {
      showMessage("Remplir le Nom");
    } else if (prenomController.text.isEmpty) {
      showMessage("Remplir le Prenom");
    } else if (promotionController.text.isEmpty) {
      showMessage("Remplir la promotion");
    } else if (adresseController.text.isEmpty) {
      showMessage("Remplir l'adresse");
    } else if (contactController.text.isEmpty) {
      showMessage("Remplir le Contact");
    } else if (mailController.text.isEmpty) {
      showMessage("Remplir le mail");
    } else if (dateController.text.isEmpty) {
      showMessage("Remplir la date");
    } else {
      String matricule = matriculeController.text;
      String nom = nomController.text;
      String prenom = prenomController.text;
      String promotion = promotionController.text;
      String adresse = adresseController.text;
      String contact = contactController.text;
      String mail = mailController.text;
      String date = dateController.text;
      EtudiantController etcont = EtudiantController();
      var eyano = await etcont.enregistrerEtudiant(
          matricule, nom, prenom, promotion, adresse, contact, mail, date);
      if (eyano == "Reussie") {
        showMessage("Etudiant enregistré !");
        reset();
      } else {
        showMessage("Erreur !$etcont");
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
    promotionController.clear();
    adresseController.clear();
    contactController.clear();
    mailController.clear();
    dateController.clear();
  }
}
