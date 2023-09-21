import 'package:bikeapp/controller/login_controller.dart';
import 'package:bikeapp/view/signup_screen.dart';
import 'package:bikeapp/widgets/mediaquery.dart';
import 'package:bikeapp/widgets/textfield.dart';
import 'package:bikeapp/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldtext("BUY NOW", 32),
                    normaltext("Discover the freedom of biking with us", 17)
                  ],
                ),
                Consumer<LoginController>(
                  builder: (context, value, child) {
                    return Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthenticationTextField(
                              controller: value.emailcontroller,
                              validatormsg: "Enter you email",
                              label: "Email",
                              keyboard: TextInputType.emailAddress,
                              prefixicon: Icons.email,
                            ),
                            SizedBox(
                              height: customHeight(context, 0.02),
                            ),
                            AuthenticationTextField(
                              controller: value.passwordcontroller,
                              validatormsg: "Enter your password",
                              label: "Password",
                              keyboard: TextInputType.text,
                              prefixicon: Icons.password,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      value.loginFunction(context);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const  Color.fromARGB(255, 25, 30, 54),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: customHeight(context, 0.05),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                normaltext("Don't have account ?", 16),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => SignUpScreen()));
                                    },
                                    child: boldtext("Sign Up", 16))
                              ],
                            )
                          ],
                        ));
                  },
                ),
                const SizedBox()
              ]),
        ),
      ),
    );
  }
}
