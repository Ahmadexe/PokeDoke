import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokedoke/cubits/users_cubit/cubit/user_cubit.dart';
import 'package:pokedoke/static/colors.dart';
import 'package:pokedoke/models/user_model.dart';
import 'package:pokedoke/screens/login_screen.dart';
import 'package:pokedoke/widgets/snackbar.dart';
import 'package:string_validator/string_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupFormKey = GlobalKey<FormBuilderState>();

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
                    "Sign up",
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
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'nameField',
                          cursorColor: secondaryColor,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
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
                              return "Field is required.";
                            }
                            if (isAlpha(value)) {
                              return "Only Alphabets are allowed.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BlocListener<UserCubit, UserState>(
                          listener: (context, state) {
                            if (context.read<UserCubit>().state
                                is UserSignedUp) {
                              snackMessage("Success",
                                  "Thank you for registering! ${context.read<UserCubit>().state.user.userName}");
                            } else if (context.read<UserCubit>().state
                                is UserSignedupError) {
                              snackMessage("error", "An error occured");
                            }
                          },
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    debugPrint(
                                      _signupFormKey.currentState!
                                          .fields['nameField']!.value,
                                    );

                                    if (_signupFormKey.currentState!
                                        .validate()) {
                                      BlocProvider.of<UserCubit>(context)
                                          .signUpUser(
                                        _signupFormKey.currentState!
                                            .fields['emailField']!.value,
                                        _signupFormKey.currentState!
                                            .fields['passwordField']!.value,
                                        _signupFormKey.currentState!
                                            .fields['nameField']!.value,
                                      );
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              secondaryColor)),
                                  child: BlocBuilder<UserCubit, UserState>(
                                    builder: (context, state) {
                                      if (state is UserSignupLoading) {
                                        return Center(
                                            child: CircularProgressIndicator(
                                          color: scaffoldBackgroundColor,
                                        ));
                                      } else {
                                        return const Text(
                                          "Sign up!",
                                          style: TextStyle(fontSize: 16),
                                        );
                                      }
                                    },
                                  ))),
                        ),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Already have an account? "),
                      Text(
                        "Login!",
                        style: TextStyle(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  snackMessage(String type, String message) {
    displaySnackbar(context, type, message);
  }
}
