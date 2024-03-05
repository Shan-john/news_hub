import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_hub/constant/constantvariables.dart';
import 'package:news_hub/constant/functions.dart';
import 'package:news_hub/model/user/user.dart';
import 'package:news_hub/service/firebase_auth_helper.dart';
import 'package:news_hub/service/firebase_storeage_helper.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    getUserInformation();
    super.initState();
  }

  UserModel userinformation = UserModel();
  Future<void> getUserInformation() async {
    userinformation =
        await Firebase_Storage_helper.instance.getuserinformation();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              userinformation.names ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              userinformation.email ?? "",
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
            label: "Logout",
            fontsize: 17,
            textcolors: Color.fromARGB(255, 37, 37, 37),
            onpressed: () => FirebaseAuth_Helper.instance.logout(),
          )
        ],
      ),
    );
  }
}
