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
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("3d4eea41-3eb9-47f8-af7e-e002befdc12e");
  OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
