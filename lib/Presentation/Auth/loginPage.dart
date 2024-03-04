import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_hub/Presentation/Auth/signUP.dart';
import 'package:news_hub/Presentation/homescreenwidget/home/home.dart';
import 'package:news_hub/constant/functions.dart';
import 'package:news_hub/constant/routes.dart';
import 'package:news_hub/service/firebase_auth_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(90),
              Text(
                "SIGN IN",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              ),
              Gap(50),
              textfieldeditor(
                height: 60,
                controller: emailcontroller,
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
              Gap(40),
              PasswordTextField(passwordcontroller: passwordcontroller),
              Gap(40),
              Primarybutton(
                height: 60,
                size: 340,
                colors: const Color.fromARGB(255, 1, 88, 202),
                label: "SIGN IN",
                fontsize: 18,
                textcolors: Colors.white,
                onpressed: () async {
                  bool validation = false;
                  bool login = false;
                  validation = loginAuthvalidation(
                    emailcontroller.text,
                    passwordcontroller.text,
                  );
                  if (validation) {
                    login = await FirebaseAuth_Helper.instance.Login(
                      emailcontroller.text,
                      passwordcontroller.text,
                    );
                  }
                  if (login == true) {
                    Routes.instance
                        // ignore: use_build_context_synchronously
                        .pushandRemoveUntil(
                            widget: HomeScreen(), context: context);
                  }
                },
              ),
              const Gap(100),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showText(
                        //if Screen type == login  the Display "Don't have an account !"
                        label: "Don't have an account !",
                        size: 16,
                        color: Color.fromARGB(255, 73, 73, 73)),
                    const Gap(10),
                    InkWell(
                      onTap: () {
                        Routes.instance
                            .push(widget: SignUppage(), context: context); 
                      },
                      child: showText(
                          //if Screen type == login  the Display "Don't have an account !"
                          label: "SignUp here",
                          size: 16,
                          color: const Color.fromARGB(255, 1, 88, 202)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
