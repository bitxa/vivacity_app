import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: _isHidden,
        decoration: InputDecoration(
          hintText: 'Ingresa tu contraseña',
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              _isHidden ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _isHidden = !_isHidden;
              });
            },
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
