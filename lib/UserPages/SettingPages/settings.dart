import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_selling/Widgets/custom_button.dart';
import 'package:dog_selling/Widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? fullName;
  String? email;
  String? password;

  Future<void> fetchCurrentUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        print('Current User ID: $userId');

        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('Users');

        DocumentSnapshot userDocument = await usersCollection.doc(userId).get();

        if (userDocument.exists) {
          final userData = userDocument.data() as Map<String, dynamic>;

          setState(() {
            fullName = userData['Full Name'] ?? '';
            email = userData['Email'] ?? '';
            password = userData['Password'] ?? '';
          });

          // Do something with the user data
          print('Full Name: $fullName');
          print('Email: $email');
          print('Password: $password');
        } else {
          print('User data not found in Firestore.');
        }
      } else {
        print('No user is signed in.');
      }
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCurrentUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: Icon(Icons.person),
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomTextfield(
                text: fullName ?? "loading....",
                icon: Icon(Icons.person),
                controller: null,
                keyboardType: null,
                suffixIcon: null),
            const SizedBox(height: 20),
            CustomTextfield(
                text: email ?? "loading....",
                icon: Icon(Icons.email),
                controller: null,
                keyboardType: null,
                suffixIcon: null),
            const SizedBox(height: 20),
            CustomTextfield(
                text: "+9212345678",
                icon: Icon(Icons.phone),
                controller: null,
                keyboardType: null,
                suffixIcon: null),
            const SizedBox(height: 20),
            CustomTextfield(
                text: password ?? "loading....",
                icon: Icon(Icons.fingerprint),
                controller: null,
                keyboardType: null,
                suffixIcon: null),
            const SizedBox(height: 20),
            Custombutton(
              text: "Edit Profile",
              color: Colors.lightGreen,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Joined 12 october 2022",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 234, 191, 188),
                    maxRadius: 30,
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          color: Color.fromARGB(255, 232, 18, 3),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
// class SettingsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final User? user = FirebaseAuth.instance.currentUser;
//     print('Current User UID: ${user?.uid}');

//     return Scaffold(
//       appBar: AppBar(title: Text('Firestore Example')),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection('Users').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             // Access and display data from Firestore
//             final data = snapshot.data!.docs;

//             if (data.isEmpty) {
//               return Center(
//                   child: Text('No data available in the "Users" collection.'));
//             }

//             return Column(
//               children: [
//                 Text(
//                   data[0]['Full Name'],
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }
