import 'package:bikeapp/view/home_screen.dart';
import 'package:bikeapp/view/loginscreen.dart';
import 'package:bikeapp/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController with ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? email;
  String? password;

  String? username = '';
  String? useremail = '';
  String? usernumber = '';

//////LOGIN
  loginFunction(context) async {
    /////Read values from the secure storage
    email = await storage.read(key: 'email');
    password = await storage.read(key: 'password');
    notifyListeners();

    if (email != null) {
      if (email == emailcontroller.text &&
          password == passwordcontroller.text) {
        await storage.write(key: "logged", value: "true");

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        CustomSnackBar().snackBar(context, 'invalid email/password',
            const Color.fromARGB(255, 148, 23, 23));
      }
    } else {
      CustomSnackBar().snackBar(context, 'invalid email/password',
          const Color.fromARGB(255, 148, 23, 23));
    }
    notifyListeners();
  }


////LOGOUT
  logoutfunction(context) async {
    await storage.delete(key: "logged");
    notifyListeners(); 
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }



 ///////USER DETAILS
 userdetails()async{
   useremail = await storage.read(key: 'email');
   username = await storage.read(key: 'username');
   usernumber = await storage.read(key: 'phone');
   notifyListeners(); 
 } 
}
