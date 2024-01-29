import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dog_selling/UserPages/SettingPages/settings.dart';
import 'package:dog_selling/UserPages/authpages/bloc/auth_bloc.dart';
import 'package:dog_selling/UserPages/authpages/signin_page.dart';
import 'package:dog_selling/UserPages/authpages/signup_page.dart';
import 'package:dog_selling/UserPages/MainPage/main_page.dart';
import 'package:dog_selling/AdminPages/add_dogs.dart';
import 'package:dog_selling/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        routes: {
          './adddogs': (context) => const AddDogsPage(),
          './settings': (context) => const SettingsPage(),
          './signin': (context) => const Signinpage(),
          './signup': (context) => const Signuppage(),
          './mainpage': (context) => const MainPage(),
        },
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: 'lib/images/dog.png',
          nextScreen: (FirebaseAuth.instance.currentUser != null)
              ? const MainPage()
              : const Signuppage(),
          splashTransition: SplashTransition.scaleTransition,
        ),
      ),
    );
  }
}
