// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vivacity_app/Authentication/password_field.dart';
import 'package:vivacity_app/Authentication/register.dart';
import 'package:vivacity_app/api/api_client.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    return Scaffold(
      body: FutureBuilder<Uint8List>(
        future: apiClient.getFileByPath('assets/login/login_bg.png'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final imageBytes = snapshot.data;

            return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(imageBytes!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset('assets/logo.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(
                          'Ingresa tus datos para continuar con tu aventura ...',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Correo electrónico',
                              style: TextStyle(
                                color: Color(0xFFFDFDFD),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
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
                            SizedBox(height: 20),
                            Text(
                              'Contraseña',
                              style: TextStyle(
                                color: Color(0xFFFDFDFD),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            PasswordField()
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      //FORGET PASSWORD
                      TextButton(
                        child: Text('¿Olvidaste tu contraseña?'),
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: SizedBox(
                          child: ElevatedButton(
                            child: Text('Ingresar'),
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  'navigationHome'); //para entrar a la app de momento
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0XffE5A000),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: const <Widget>[
                          Expanded(
                              child:
                                  Divider(thickness: 1, color: Colors.white)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('O',
                                style: TextStyle(color: Colors.white)),
                          ),
                          Expanded(
                              child:
                                  Divider(thickness: 1, color: Colors.white)),
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
                          SizedBox(height: 20),
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
                      SizedBox(height: 24.0),
                      // Sign up link
                      Center(
                        child: TextButton(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('¿Aún no tienes tu cuenta?'),
                                SizedBox(width: 8),
                                Text(
                                  'Regístrate',
                                  style: TextStyle(color: Color(0xffffe71e)),
                                )
                              ]),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
