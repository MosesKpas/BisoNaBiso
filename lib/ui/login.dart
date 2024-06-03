import 'package:bisonabiso/ui/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    //final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.20,
                  child: const FittedBox(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/upc.jpg"),
                      radius: 25,
                    ),
                  ),
                ),
                Container(
                  height: deviceHeight * 0.55,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LayoutBuilder(builder: ((ctx, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Connexion',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.01),
                        const Text("Entrez les informations "),
                        SizedBox(height: constraints.maxHeight * 0.08),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(
                              color: const Color(0xffB4B4B4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Votre mail",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Container(
                          height: constraints.maxHeight * 0.12,
                          decoration: BoxDecoration(
                            color: const Color(0xffB4B4B4).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.text ,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Mot de passe",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Mot de passe oublié",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: constraints.maxHeight * 0.12,
                          // margin: EdgeInsets.only(
                          //   top: constraints.maxHeight * 0.1,
                          // ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePage()));
                              //print("button");
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                )),
                            child: const Text(
                              "Se connecter",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Pas de compte',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                children: [
                              TextSpan(
                                  text: " créer",
                                  style: const TextStyle(
                                    color: Color(0xffF80849),
                                    fontSize: 18,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //print("Click");
                                    }),
                            ]))
                      ],
                    );
                  })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
