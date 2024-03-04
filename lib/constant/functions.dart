import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

void launchweb({required String url}) async {
  final _url = Uri.parse('${url}');

  try {
    await launchUrl(_url);
  } catch (e) {
    print("shan jon$e");
  }
}

class Primarybutton extends StatefulWidget {
  final double size;
  final double fontsize;
  final Widget? icon;
  final Color colors;
  final double? height;
  final String label;
  final Color textcolors;
  final void Function()? onpressed;
  const Primarybutton({
    super.key,
    this.height = 45,
    this.onpressed,
    required this.size,
    this.icon,
    required this.colors,
    required this.label,
    required this.fontsize,
    required this.textcolors,
  });

  @override
  State<Primarybutton> createState() => _PrimarybuttonState();
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: widget.size,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: widget.colors,
          ),
          child: MaterialButton(
            onPressed: widget.onpressed,
            shape: const OvalBorder(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.icon ?? const SizedBox(),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.textcolors,
                    fontSize: widget.fontsize,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      textColor: Colors.white,
      fontSize: 16.0);
}



bool loginAuthvalidation(
  String email,
  String password,
) {
  if (email.isEmpty && password.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (password.isEmpty) {
    showMessage("password is empty");
    return false;
  } else {
    return true;
  }
}

 
bool signUpAuthvalidation(String email, String password, String name) {
  if (email.isEmpty && password.isEmpty && name.isEmpty) {
    showMessage("feilds is empty");
    return false;
  } else if (email.isEmpty) {
    showMessage("Email is empty");
    return false;
  } else if (password.isEmpty) {
    showMessage("password is empty");
    return false;
  } else if (name.isEmpty) {
    showMessage("name is empty");
    return false;
  } else {
    return true;
  }
}



class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordcontroller;
  PasswordTextField({
    super.key,
    required this.passwordcontroller,
  });

  bool obscuretext = true;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        
          color: Color.fromARGB(255, 46, 46, 46),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
      
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        obscureText: widget.obscuretext,
        controller: widget.passwordcontroller,
            
        decoration: InputDecoration(
       
           border: InputBorder.none, 
          // ink well to switch the visiblity to true and false
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  widget.obscuretext = !widget.obscuretext;
                });
              },
              child: widget.obscuretext == false
                  ? const Icon(Icons.remove_red_eye,color:  Color.fromARGB(150, 207, 207, 207), )
                  : const Icon(Icons.visibility_off,color:  Color.fromARGB(150, 207, 207, 207),)),
          labelText: "Password",
          labelStyle: const TextStyle(
              color: Color.fromARGB(150, 207, 207, 207), fontSize: 20),
        ),
      ),
    );
  }
}


Widget textfieldeditor(
    {required TextEditingController controller,
    required InputDecoration decoration,
    required double height,
    TextInputType? keyboardType}) {
  return Container(
    height: height,
    decoration:  BoxDecoration(
      
        color: Color.fromARGB(255, 46, 46, 46),
        borderRadius: BorderRadius.all(Radius.circular(25))),
    margin: const EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextFormField(
      keyboardType: keyboardType,
     
      style: const TextStyle(color: Color.fromARGB(255, 243, 243, 243)),
      controller: controller,
      decoration: decoration,
    ),
  );
}

Text showText(
    {required String label, required double size, required Color color}) {
  return Text(
    label,
    
    style: TextStyle(
      color: color,
      fontSize: size,
    ),
  );
}
