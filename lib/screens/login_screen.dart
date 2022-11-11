import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokedoke/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: secondaryColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              FormBuilder(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'emailField',
                        cursorColor: secondaryColor,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          labelStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                        validator: FormBuilderValidators.email(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      FormBuilderTextField(
                        name: 'passwordField',
                        cursorColor: secondaryColor,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          labelStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: secondaryColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Field can't be empty.";
                          }
                          if (value.length < 8) {
                            return "Password can't be shorter than 8 words.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  print("Ok");
                                } else {
                                  print("Not ok");
                                }
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          secondaryColor)),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ))),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Don't have an account? "),
                    Text(
                      "Sign up!",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
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
