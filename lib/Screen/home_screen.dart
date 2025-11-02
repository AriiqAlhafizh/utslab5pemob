import 'package:flutter/material.dart';
import 'package:utslab5pemob/Widgets/custom_navbar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Center(
              child: FloatingActionButton(onPressed: () {  },),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomNavbar(),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade200,
    );
  }
}
