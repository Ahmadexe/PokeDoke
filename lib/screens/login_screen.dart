import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/user_cubit.dart';
import 'package:pokedoke/static/colors.dart';
import 'package:pokedoke/database/cloud/firestore_methods.dart';
import 'package:pokedoke/models/user_model.dart';
import 'package:pokedoke/screens/signup_screen.dart';
import 'package:pokedoke/services/authentications.dart';

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
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    // return

                    if (state is UserLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: scaffoldBackgroundColor,
                        ),
                      );
                    } else {
                      return Text(
                        "Login",
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      );
                    }
                  },
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
                        textCapitalization: TextCapitalization.sentences,
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
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required()
                        ]),
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
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.minLength(8),
                            FormBuilderValidators.required()
                          ])),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_loginFormKey.currentState!.validate()) {
                                  debugPrint("Here");
                                  context.read<UserCubit>().loginUser(
                                      _loginFormKey.currentState!
                                          .fields['emailField']!.value,
                                      _loginFormKey.currentState!
                                          .fields['passwordField']!.value,
                                      context);
                                  debugPrint("Here 2");
                                } else {}
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          secondaryColor)),
                              child: BlocBuilder<UserCubit, UserState>(
                                builder: (context, state) {
                                  if (state is UserLoading) {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: scaffoldBackgroundColor,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      "Login",
                                      style: TextStyle(fontSize: 16),
                                    );
                                  }
                                },
                              ))),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.43,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignupScreen()));
                },
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
