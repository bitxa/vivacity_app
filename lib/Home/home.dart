// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista Home',
              style: TextStyle(
                color: Colors.white,
              )),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'catalogo');
                },
                icon: const Icon(Icons.accessibility)),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Center(
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: null,
                    child: Text('Botón uno'),
                  ),
                  ElevatedButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.add),
                    label: Text('Botón dos'),
                  ),
                  FilledButton(onPressed: null, child: Text('Filled')),
                  FilledButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.ac_unit_sharp),
                    label: Text('Botón seis'),
                  ),
                  TextButton(onPressed: () {}, child: Text('Botón texto')),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, 'contenedor');
                      },
                      icon: Icon(
                        Icons.accessibility_new_sharp,
                      ),
                      label: Text('Contenedor')),
                  IconButton(
                      onPressed: null, icon: Icon(Icons.add_alert_rounded)),
                ],
              ),
            )));
  }
}
