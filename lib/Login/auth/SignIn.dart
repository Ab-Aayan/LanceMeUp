import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lancemeup/Login/auth/widget/widget.dart';

import '../../screen/main_app.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController forgetPasswordController = TextEditingController();
  bool _rememberMe = false;
  final bool _isLoading = false;
  String password = "";
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 125, 206, 128)));
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 206, 128),
        toolbarHeight: height * 0.134,
        title: const Text('Sign in'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: const Text(
                      "Welcome Back",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: const Text(
                      "Login to your account",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Email'),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Form(
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Password'),
                      ),
                      SizedBox(
                        height: height * 0.0045,
                      ),
                      Form(
                        child: TextFormField(
                          obscureText: _obscureText,
                          autofocus: false,
                          decoration: textInputDecoration.copyWith(
                            contentPadding: EdgeInsets.fromLTRB(width * 0.04,
                                height * 0.02, width * 0.04, height * 0.02),
                            // const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                                activeColor:
                                    const Color.fromRGBO(98, 178, 70, 1),
                              ),
                              const Text('Remember me'),
                            ],
                          ),
                          const Spacer(),
                          Text.rich(
                            TextSpan(
                              text: "Forgot password?",
                              style: const TextStyle(
                                  color: Color.fromRGBO(98, 178, 70, 1),
                                  fontSize: 15),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  _bottomSheet(context);
                                },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.2,
                      ),
                      SizedBox(
                        height: height * 0.058,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(98, 178, 70, 1)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainApp()));
                          },
                          child: const Text('Login'),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0245, //22,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign up",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 103, 192, 106),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //forget password
  _bottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        final height = MediaQuery.of(context).size.height;
        return Scaffold(
          //backgroundColor: Colors.green[300],
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 80),
                    child: Form(
                      // key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Forget password",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: height * 0.03),
                          const Text(
                            "Enter your email for the verification proccess, we will send forget link to your email.",
                          ),
                          SizedBox(height: height * 0.04),
                          TextFormField(
                            controller: forgetPasswordController,
                            decoration: textInputDecoration.copyWith(
                              labelText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else {
                                return "Email cannot be empty";
                              }
                            },
                          ),
                          SizedBox(height: height * 0.064),
                          SizedBox(
                            height: height * 0.058,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(98, 178, 70, 1)),
                              onPressed: () async {
                                var forgetEmail =
                                    forgetPasswordController.text.trim();
                                try {
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                        email: forgetEmail,
                                      )
                                      .then(
                                        (value) => {
                                          print("Email Send !"),
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              icon: Image.asset(
                                                "assets/images/tick.webp",
                                                width: 48,
                                                height: height * 0.0934,
                                              ),
                                              content: const Text(
                                                "Password rest request was sent sucessfully, Please check your email to reset your password..",
                                              ),
                                              actions: [
                                                Center(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        ctx,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SignIn(),
                                                        ),
                                                      );
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        },
                                      );
                                } on FirebaseAuthException catch (e) {
                                  if (kDebugMode) {
                                    print('Error $e');
                                  }
                                }
                              },
                              child: const Text('Send'),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
