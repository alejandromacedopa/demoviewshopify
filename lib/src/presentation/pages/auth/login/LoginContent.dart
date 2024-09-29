import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:demo_view_shopify/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:demo_view_shopify/src/presentation/utils/BlocFormItem.dart';
import 'package:demo_view_shopify/src/presentation/widget/DefaultTextField.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginContent extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;

  LoginContent(this.bloc, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackground(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.80,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.3),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                _iconPerson(),
                _textLogin(),
                _TextFieldEmail(),
                _TextFieldPassword(),
                _buttonLogin(context),
                _buttonRegister(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    // Obtiene las dimensiones de la pantalla solo una vez
    final size = MediaQuery.of(context).size;

    return Image.asset(
      'assets/img/login.png',
      width: size.width, // Ancho de la pantalla
      height: size.height, // Alto de la pantalla
      fit: BoxFit.cover, // La imagen cubrirá todo el fondo
      color: Colors.black54.withOpacity(
          0.7), // Le das un efecto oscuro con transparencia ajustable
      colorBlendMode: BlendMode.darken, // Mezcla para oscurecer la imagen
    );
  }

  Widget _iconPerson() {
    return Icon(
      Icons.person,
      color: Colors.white,
      size: 125,
    );
  }

  Widget _textLogin() {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.blue, const Color.fromARGB(255, 255, 255, 255)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 32, // Aumenta el tamaño del texto
          fontWeight: FontWeight.bold, // Negrita para darle más presencia
          letterSpacing: 4, // Espaciado amplio entre letras
          color: Colors.white, // Color blanco que será mezclado con el shader
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black38, // Sombra sutil para darle profundidad
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _TextFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'email',
        icon: Icons.email,
        onChange: (text) {
          bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.password.error;
        },
      ),
    );
  }

  Widget _TextFieldPassword() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Password',
        icon: Icons.lock,
        onChange: (text) {
          bloc?.add(PasswordChanged(password: BlocFormItem(value: text)));
        },
        obscureText: true,
        validator: (value) {
          return state.password.error;
        },
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: ElevatedButton(
          onPressed: () {
            if (state.formKey!.currentState!.validate()) {
              bloc!.add(LoginSubmit());
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(
            'Iniciar Sesion',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  Widget _buttonRegister(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            'Registrese',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
