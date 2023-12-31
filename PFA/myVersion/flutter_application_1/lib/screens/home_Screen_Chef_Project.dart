import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFCED4DA),
              Color(0xFFCED4DA),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF495057),
                      Color(0xFFCED4DA),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          'SafeDispose',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoCondensed(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "I am a",
                    //   textAlign: TextAlign.center,
                    //   style: GoogleFonts.robotoCondensed(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: _buildClientCard('./images/social-media.gif', 'Client'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildClientCard('./images/social-care.gif', 'Employee'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildClientCard('./images/pakistani.gif', 'Manager'),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Welcome to SafeDispose',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: yourCustomFunction,
                      icon: Icon(Icons.help),
                      label: Text('Help !!!'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFCED4DA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientCard(String imagePath, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = title;
        });
        yourCustomFunction();
      },
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 22,
              color: Color(0xFF2E94B9).withOpacity(0.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 11),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void yourCustomFunction() {
    // Handle the functionality based on the selected role
    if (selectedRole == 'Client') {
      // Add your code for the 'Client' role
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login_screen()),
      );
    } else if (selectedRole == 'Employee') {
      // Add your code for the 'Employee' role
      print('Employee role selected');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login_screen()),
      );
    } else if (selectedRole == 'Manager') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login_screen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => helpPage(context)),
      );
    }
  }
}

Widget helpPage(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Help'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'How can we assist you?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: Text('Contact Support'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: Text('FAQs'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            child: Text('Tutorials'),
          ),
        ],
      ),
    ),
  );
}
