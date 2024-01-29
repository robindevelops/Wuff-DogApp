// ignore_for_file: non_constant_identifier_names

import 'package:dog_selling/UserPages/authpages/bloc/auth_bloc.dart';
import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:dog_selling/Widgets/custom_password_textfield.dart';
import 'package:dog_selling/Widgets/custom_textfield.dart';
import 'package:dog_selling/Widgets/squaretile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthBloc>(context);
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    TextEditingController fullname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController Cpassword = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignUpError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.errorMessage.toString(),
                  ),
                ),
              );
            }
            if (state is SignUpSuccessful) {
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  text: ' Full Name',
                  icon: const Icon(Icons.person),
                  controller: fullname,
                  keyboardType: null,
                  suffixIcon: null,
                ),
                SizedBox(height: screenheight * 0.015),
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
                CustomPasswordTextfield(
                  text: 'Confirm Password',
                  icon: const Icon(Icons.lock),
                  controller: Cpassword,
                  keyboardType: null,
                ),
                SizedBox(height: screenheight * 0.015),
                Custombutton(
                  text: 'Sign Up',
                  color: Colors.lightGreen,
                  onPressed: () {
                    auth.add(
                      RegisterButtonPressed(
                        fullname: fullname.text,
                        email: email.text,
                        password: password.text,
                        Cpassword: Cpassword.text,
                        context: context,
                      ),
                    );
                  },
                ),
                SizedBox(height: screenheight * 0.015),
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
                      "Already Have an account ?",
                      style: GoogleFonts.aBeeZee(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          "./signin",
                          (route) => false,
                        );
                      },
                      child: const Text("Signin"),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
