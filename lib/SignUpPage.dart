import 'package:flutter/material.dart';
import 'package:task2/loginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(){
    if(_formKey.currentState!.validate()){
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;

      print("Name : $name, Email: $email, Password: $password");
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
              child: Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 40      ,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),

                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[

                        TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const loginPage()),
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
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextFormField(

                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white.withOpacity(0.7),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your email';
                        }
                        return null;
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
                          )
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
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

                      label: Text('Sign up',
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
    ]
      ),
    );

  }
}