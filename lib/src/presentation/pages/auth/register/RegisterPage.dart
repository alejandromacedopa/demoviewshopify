import 'package:demo_view_shopify/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:demo_view_shopify/src/presentation/widget/DefaultIconBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _imageUrlController =
      TextEditingController(); // Controlador para la URL de la imagen

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registro exitoso')),
          );
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/img/register.jpg",
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 125,
                      ),
                      _textRegister(),
                      // Campo para la URL de la imagen
                      _buildTextField(_nameController, "Nombre", Icons.person),
                      _buildTextField(_lastnameController, "Apellido",
                          Icons.person_outline),
                      _buildTextField(_emailController, "Email", Icons.email),
                      _buildTextField(
                          _imageUrlController, "URL de la Imagen", Icons.image),
                      _buildTextField(
                          _phoneController, "Teléfono", Icons.phone),
                      _buildTextField(
                          _passwordController, "Contraseña", Icons.lock,
                          isPassword: true),
                      _buildTextField(_confirmPasswordController,
                          "Confirmar Contraseña", Icons.lock_outline,
                          isPassword: true),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 25, right: 25, top: 25, bottom: 15),
                        child: BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state is RegisterLoading
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        if (_passwordController.text !=
                                            _confirmPasswordController.text) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Las contraseñas no coinciden')),
                                          );
                                        } else {
                                          await Future.delayed(
                                              Duration(seconds: 5));

                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(
                                            RegisterButtonPressed(
                                              name: _nameController.text,
                                              lastname:
                                                  _lastnameController.text,
                                              email: _emailController.text,
                                              phone: _phoneController.text,
                                              password:
                                                  _passwordController.text,
                                              image: _imageUrlController
                                                  .text, // Enviar la URL de la imagen
                                            ),
                                          );
                                        }
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 33, 103, 207),
                              ),
                              child: state is RegisterLoading
                                  ? CircularProgressIndicator()
                                  : Text("Registrarse",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            DefaultIconBack(left: 65, top: 120)
          ],
        ),
      ),
    );
  }

  // No olvides agregar este método en la clase
  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(icon, color: Colors.white),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
        validator: (value) => value!.isEmpty ? 'Este campo es requerido' : null,
      ),
    );
  }

  Widget _textRegister() {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.cyan, Colors.blueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: const Text(
        "Regístrate",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          color: Colors.white,
          shadows: [
            Shadow(
              offset: Offset(1.5, 1.5),
              blurRadius: 3.0,
              color: Colors.black38,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
