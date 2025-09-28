import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task2/SignUpPage.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
final _formKey = GlobalKey<FormState>();
String _fullPhoneNumber = '';
final TextEditingController _passwordController = TextEditingController();

void _login(){
  if(_formKey.currentState!.validate()){
    String mobile = _fullPhoneNumber;
    String password = _passwordController.text;

    print("Mobile numbere: $mobile, Password: $password");
  }
}
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child:SafeArea(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child:Text(
                'Login',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  children: <TextSpan>[
              TextSpan(text: 'Don\'t have an account? '),
              TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signuppage()),
                      );
                    },
              ),
                  ],
              ),
          ),
          ),


        SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    fillColor: Colors.white.withOpacity(0.7),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    setState(() {
                      _fullPhoneNumber = phone.completeNumber;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.white.withOpacity(0.7),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
          SizedBox(height: 16),

          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _login,

              label: Text('Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            icon: Icon(
              Icons.login,
              color: Colors.white,
              size: 24,
            ),


          ),
            ),
            ],
        ),
      ),
      ),
      ),


    ),
        Padding(padding: const
             EdgeInsets.only(top: 36.0, left: 16.0),
        child: Align(
          alignment: Alignment.topLeft,

          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 19,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        ),
        Padding(padding: const EdgeInsets.only(top: 636.0, left:  90),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.apple,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(width: 15),
            Icon(
              Icons.facebook,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(width: 15),
            Icon(
              FontAwesomeIcons.google,
              size: 26,
            ),
            SizedBox(width: 15),
            Icon(
              FontAwesomeIcons.squareTwitter,
              color: Colors.blue,
              size: 30,
            )

          ],
        ),
        )
  ]
    ),
  );
}
}