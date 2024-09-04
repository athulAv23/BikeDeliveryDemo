import 'package:bikeapp/controller/bikeorder_controller.dart';
import 'package:bikeapp/controller/login_controller.dart';
import 'package:bikeapp/controller/signup_controller.dart';
import 'package:bikeapp/view/home_screen.dart';
import 'package:bikeapp/view/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController(),),
        ChangeNotifierProvider(create: (context) => SignupController(),),
        ChangeNotifierProvider(create: (context) => BikeOrderController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: storage.read(key: "logged"),
          builder: (context, snapshot) {
            final String? logged = snapshot.data;

            if (logged != null) {
              return const HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: const  Color.fromARGB(255, 25, 30, 54)),
      ),
    );
  }
}
