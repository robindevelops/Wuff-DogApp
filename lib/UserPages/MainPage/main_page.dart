// ignore_for_file: prefer_const_constructors

import 'package:dog_selling/UserPages/authpages/bloc/auth_bloc.dart';
import 'package:dog_selling/Widgets/custom_textfield.dart';
import 'package:dog_selling/UserPages/DogPages/germanShepherd_page.dart';
import 'package:dog_selling/UserPages/DogPages/labrador_page.dart';
import 'package:dog_selling/UserPages/DogPages/samoyed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Hello Alyan",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Spacer(),
            Stack(
              alignment: Alignment.topRight,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.favorite_border, size: 30),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  maxRadius: 9,
                  child: Text("2"),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, './settings');
              },
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 40,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text(
                  "H O M E",
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "./settings");
                },
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text("S E T T I N G S"),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_rounded,
                  color: Colors.black,
                ),
                title: Text("A B O U T"),
              ),
              ListTile(
                leading: Image.asset(
                  "lib/images/power-off.png",
                  height: 25,
                ),
                title: Text("L O G O U T"),
                onTap: () {
                  auth.add(LogOutButtonPressed(context: context));
                },
              ),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            CustomTextfield(
              icon: const Icon(Icons.search, color: Colors.black),
              text: "Find  dogs",
              controller: null,
              keyboardType: null,
              suffixIcon: null,
            ),
            const SizedBox(height: 10),
            const TabBar(
              indicatorColor: Colors.lightGreen,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Labradore",
                ),
                Tab(
                  text: "Samoyed",
                ),
                Tab(
                  text: "German Shepherd",
                )
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  LabradorPage(),
                  SamoyedPage(),
                  GermanShepherd(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
