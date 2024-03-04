import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/constant/functions.dart';
import 'package:news_hub/service/firebase_auth_helper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(
        255,
        36,
        36,
        36,
      ).withOpacity(0.95),
      elevation: 2,
      surfaceTintColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20),
          SizedBox(
            height: 100,
            child: Image.asset(Customimage.instance.applogo),
          ),
          ListTile(
            title: Text(
              "Shan john",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Shanjohn5308@gmail.com",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Gap(10),
          Primarybutton(
            size: 90,
            colors: Color.fromARGB(255, 209, 209, 209),
            label: "Logout" ,
            fontsize: 17,
            textcolors: Color.fromARGB(255, 37, 37, 37),
          )
        ],
      ),
    );
  }
}
