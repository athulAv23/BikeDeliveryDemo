import 'package:bikeapp/controller/signup_controller.dart';
import 'package:bikeapp/view/loginscreen.dart';
import 'package:bikeapp/widgets/mediaquery.dart';
import 'package:bikeapp/widgets/textfield.dart';
import 'package:bikeapp/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
 SignUpScreen({super.key});

  final GlobalKey<FormState> signupkey = GlobalKey();
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
                Consumer<SignupController>(
                  builder: (context, value, child) {
                    return Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: signupkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthenticationTextField(
                              controller: value.usernamecontroler,
                              validatormsg: "Enter username",
                              label: "Username",
                              keyboard: TextInputType.name,
                              prefixicon: Icons.person,
                            ),
                            SizedBox(
                              height: customHeight(context, 0.02),
                            ),
                            AuthenticationTextField(
                              controller: value.phonecontroler,
                              validatormsg: "Enter your phone number",
                              label: "Phone number",
                              keyboard: TextInputType.number,
                              prefixicon: Icons.phone,
                            ),
                            SizedBox(
                              height: customHeight(context, 0.02),
                            ),
                            AuthenticationTextField(
                              controller: value.emailcontroler,
                              validatormsg: "Enter your email",
                              label: "Email",
                              keyboard: TextInputType.emailAddress,
                              prefixicon: Icons.email,
                            ),
                            SizedBox(
                              height: customHeight(context, 0.02),
                            ),
                            AuthenticationTextField(
                              controller: value.passwordcontroler,
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
                                    if (signupkey.currentState!.validate()) {
                                      value.signupFunction(context);
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
                                      "Sign Up",
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
                                normaltext("Already have account ?", 16),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => LoginScreen()));
                                    },
                                    child: boldtext("Sign In", 16))
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
