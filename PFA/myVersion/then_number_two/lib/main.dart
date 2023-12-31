import 'package:flutter/material.dart';
import 'package:then_number_two/home_page.dart';
import 'package:then_number_two/profile_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  //when the user touch something it refreches the app
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  // int currentPage = 0;
  // List<Widget> pages = const [HomePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Trash Tracker",
        ), //ctrl j for terminal
      ),
      body: const HomePage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.perm_contact_cal_outlined),
            label: "Calender",
          ),
          SpeedDialChild(
            child: const Icon(Icons.perm_contact_cal_outlined),
            label: "Calender",
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("Tap"); //print the text inside the terminal
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.home,
                    ),
                    Text("Home"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Tip");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.person,
                    ),
                    Text("Profile"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
