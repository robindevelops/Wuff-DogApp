import 'package:dog_selling/Widgets/admin_tile.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Admin Panel"),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                admintile(
                  icon: const Icon(Icons.add),
                  image: "lib/images/dog.png",
                  text: "Add Dog",
                  onTap: () {
                    Navigator.pushNamed(context, "./adddogs");
                  },
                ),
                admintile(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  image: "lib/images/dog.png",
                  text: "Orders",
                  onTap: () {},
                ),
                admintile(
                  icon: const Icon(Icons.format_list_bulleted_sharp),
                  image: "lib/images/dog.png",
                  text: "Listed Dogs",
                  onTap: () {},
                ),
                admintile(
                  icon: const Icon(Icons.format_list_bulleted_sharp),
                  image: "lib/images/dog.png",
                  text: "Active Users",
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
