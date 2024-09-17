import 'package:flutter/material.dart';
import 'package:demo_view_shopify/src/presentation/widget/DefaultTextField.dart';
import 'package:demo_view_shopify/src/presentation/widget/DefaultIconBack.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/background5.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.4),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: SingleChildScrollView(
                child: Column(children: [
              const Icon(
                Icons.person,
                color: Colors.black,
                size: 125,
              ),
              const Text(
                "Registrate",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      "Nombre",
                      style: TextStyle(color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      "Telefono",
                      style: TextStyle(color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                      label: 'Contraseña',
                      icon: Icons.lock,
                      onChange: (text) {
                        print('text: ${text}');
                      },
                      obscureText: true)),
              Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: DefaultTextField(
                      label: 'Confirmar Contraseña',
                      icon: Icons.lock_outline,
                      onChange: (text) {
                        print('text: ${text}');
                      },
                      obscureText: true)),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Text("Registrarse",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ))
            ])),
          ),
          DefaultIconBack(left: 65, top: 120)
        ],
      ),
    );
  }
}
