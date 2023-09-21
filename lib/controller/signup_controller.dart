
import 'package:bikeapp/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupController with ChangeNotifier {
  TextEditingController usernamecontroler = TextEditingController();
  TextEditingController phonecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  signupFunction(context) async {
    final username = usernamecontroler.text.trim();
    final phone = phonecontroler.text.trim();
    final email = emailcontroler.text.trim();
    final password = passwordcontroler.text.trim();

    await storage.write(key: 'username', value: username); 
    await storage.write(key: 'phone', value: phone); 
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
    notifyListeners();
    
    CustomSnackBar().snackBar(context, 'account created successfuly. Please Signin', const Color.fromARGB(255, 23, 148, 87));

    usernamecontroler.clear();
    phonecontroler.clear();
    emailcontroler.clear();
    passwordcontroler.clear();

    notifyListeners(); 
  }
}
