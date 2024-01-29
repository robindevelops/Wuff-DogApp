import 'package:dog_selling/UserPages/authpages/bloc/auth_bloc.dart';
import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:dog_selling/Widgets/custom_password_textfield.dart';
import 'package:dog_selling/Widgets/custom_textfield.dart';
import 'package:dog_selling/Widgets/squaretile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthBloc>(context);
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.errorMessage.toString(),
                  ),
                ),
              );
            } else if (state is LoginSuccessful) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    state.message.toString(),
                  ),
                ),
              );
            } else if (state is ResetEmailSend) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    state.message.toString(),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: screenheight * 0.05),
                Text(
                  "W u f f !",
                  style: GoogleFonts.rubikBurned(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: screenwidth * 0.09,
                  ),
                ),
                Image.asset(
                  "lib/images/authdog.png",
                  height: screenheight * 0.2,
                ),
                CustomTextfield(
                  text: 'Email',
                  icon: const Icon(Icons.email),
                  controller: email,
                  keyboardType: null,
                  suffixIcon: null,
                ),
                SizedBox(height: screenheight * 0.015),
                CustomPasswordTextfield(
                  text: 'Password',
                  icon: const Icon(Icons.lock),
                  controller: password,
                  keyboardType: null,
                ),
                SizedBox(height: screenheight * 0.015),
                Custombutton(
                  text: 'Sign In',
                  color: Colors.lightGreen,
                  onPressed: () {
                    auth.add(
                      LoginButtonPressed(
                        email: email.text,
                        password: password.text,
                        context: context,
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: screenwidth * 0.1),
                      child: TextButton(
                        onPressed: () {
                          auth.add(
                            ResetPasswordButtonPressed(
                                context: context, email: email.text),
                          );
                        },
                        child: const Text(
                          "Forget Password",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.1),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Text("or"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenheight * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    squaretile(
                      onTap: () {},
                      image: 'lib/images/google.png',
                    ),
                    SizedBox(width: screenwidth * 0.01),
                    squaretile(
                      onTap: () {},
                      image: 'lib/images/facebook.png',
                    ),
                    SizedBox(width: screenwidth * 0.01),
                  ],
                ),
                SizedBox(height: screenheight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New To Wuff ?",
                      style: GoogleFonts.aBeeZee(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "./signup",
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "SignUp",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                const Text(
                  'Copyright © 2024 Wuff Company. All rights reserved.',
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
