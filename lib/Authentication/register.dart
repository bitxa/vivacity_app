// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivacity_app/Authentication/login.dart';
import 'package:vivacity_app/Authentication/password_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Image.asset('assets/logo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Estás cerca de tu nueva aventura, ingresa tu información para registrarte',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Text(
                          'Nombres',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu nombre completo',
                              prefixIcon: Icon(Icons.mail_rounded),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Text(
                          'Correo electrónico',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu correo electrónico',
                              prefixIcon: Icon(Icons.mail_rounded),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Text(
                          'Contraseña',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu nueva contraseña',
                              prefixIcon: Icon(Icons.mail_rounded),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Text(
                          'Repite la contraseña',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingresa nuevamente la contraseña',
                              prefixIcon: Icon(Icons.mail_rounded),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Text(
                          'Número celular',
                          style: TextStyle(
                            color: Color(0xFFFDFDFD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 11.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Ingresa tu correo electrónico',
                              prefixIcon: Icon(Icons.mail_rounded),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 60, right: 60),
                  child: SizedBox(
                    child: ElevatedButton(
                      child: Text('Ingresar'),
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0XffE5A000),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: const <Widget>[
                    Expanded(child: Divider(thickness: 1, color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('O', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.white)),
                  ],
                ),
                SizedBox(height: 24.0),
                ButtonBar(
                  buttonPadding: EdgeInsets.only(left: 20, right: 20),
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Google sign in button
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(FontAwesomeIcons.google),
                          SizedBox(width: 8),
                          Text('Iniciar sesión con Google'),
                        ],
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffec5447),
                          foregroundColor: Colors.white),
                    ),
                    // Facebook sign in button
                    ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(Icons.facebook_rounded),
                          SizedBox(width: 8),
                          Text('Iniciar sesión con Facebook'),
                        ],
                      ),
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4a6dad),
                          foregroundColor: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.0,
                      color: Color(0xFFE5A000),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
