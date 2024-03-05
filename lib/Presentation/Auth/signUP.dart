import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/constant/functions.dart';
import 'package:news_hub/constant/routes.dart';
import 'package:news_hub/service/firebase_auth_helper.dart';
import 'dart:math' show asin, cos, pi, pow, sin, sqrt;

class SignUppage extends StatelessWidget {
  SignUppage({super.key});

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Gap(60),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
                const Gap(60),
                textfieldeditor(
                  height: 60,
                  controller: usernamecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(150, 207, 207, 207),
                    ),
                    labelText: "Username",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(150, 207, 207, 207),
                        fontSize: 19,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const Gap(40),
                textfieldeditor(
                  keyboardType :TextInputType.emailAddress,
                  height: 60,
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(150, 207, 207, 207),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(150, 207, 207, 207),
                        fontSize: 19,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const Gap(40),
                PasswordTextField(passwordcontroller: passwordcontroller),
                const Gap(20),
                const Gap(20),
                Primarybutton(
                  height: 60,
                  size: 340,
                  colors: const Color.fromARGB(255, 1, 88, 202),
                  label: "SIGN IN",
                  fontsize: 18,
                  textcolors: Colors.white,
                  onpressed: () async {
                    // checking the password and email are not null if it true return true
                    bool validation = false;
                    validation = signUpAuthvalidation(emailcontroller.text,
                        passwordcontroller.text, usernamecontroller.text);
                    if (validation) {
                  bool isSignuped =  await  FirebaseAuth_Helper.instance.SignUp(emailcontroller.text, passwordcontroller.text, usernamecontroller.text);
                      isSignuped == true?
                      Routes.instance.pushandRemoveUntil(
                          widget: HomeScreen(), context: context) : showMessage(
                            "failed" 
                          );
                    }
                  },
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showText(
                        //if Screen type == login  the Display "Don't have an account !"
                        label: "Don't have an account !",
                        size: 16,
                        color: const Color.fromARGB(255, 247, 247, 247)),
                    const Gap(10),
                    InkWell(
                      onTap: () {
                        Routes.instance.pop(context);
                      },
                      child: showText(
                          //if Screen type == login  the Display "Don't have an account !"
                          label: "SignUp here",
                          size: 16,
                          color: const Color.fromARGB(255, 1, 88, 202)),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
