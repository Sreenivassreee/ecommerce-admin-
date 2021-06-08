import 'package:admin_for_e_commerce/MainScreen.dart';
import 'package:admin_for_e_commerce/screens/Services/firebase/firestore.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: pass,
      onChanged: (value) {
        if (value.isNotEmpty) {
        } else if (value.length >= 8) {}
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder()),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: email,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              buildEmailFormField(),
              SizedBox(
                height: 20,
              ),
              buildPasswordFormField(),
              Spacer(),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                        (route) => false);
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) => MainScreen(),),);
                  },
                  child: Text(
                    "SignIn",
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
