import 'package:flutter/material.dart';

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField(
      {super.key,
      this.keyboard,
      this.prefixicon,
      required this.label,
      required this.controller,
      required this.validatormsg});

  final TextEditingController controller;
  final String validatormsg;
  final TextInputType? keyboard;
  final IconData? prefixicon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return validatormsg;
        } else {
          return null;
        }
      },
      cursorColor: const  Color.fromARGB(255, 25, 30, 54),
      keyboardType: keyboard,
      decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color:  Color.fromARGB(255, 25, 30, 54)),
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 226, 230, 233),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          prefixIcon: Icon(
            prefixicon,
            color: const  Color.fromARGB(255, 25, 30, 54),
          )),
    );
  }
}
