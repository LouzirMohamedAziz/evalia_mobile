import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/sign_in.dart';
import 'package:provider/provider.dart';

import '../constants/images.dart';
import '../constants/texts.dart';
import '../main.dart';
import '../reusable/evalia_main_title.dart';
import 'account_screen.dart';
import 'indicators_screen.dart';
import 'ratings_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0; // Initialize to the first page index
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      WelcomePage(
        currentIndex: _currentIndex,
        updateIndex: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      RatingsPage(),
      IndicatorsPage(),
      AccountPage(),
    ];
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate),
            label: 'Ratings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review_outlined),
            label: 'Indicators',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromRGBO(13, 110, 236, 1),
        unselectedItemColor: Color.fromRGBO(0, 75, 141, 1),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final int currentIndex;
  final Function(int) updateIndex;

  WelcomePage({required this.currentIndex, required this.updateIndex});

  IconData iconRatings = Icons.star_rate_rounded;
  IconData iconIndicators = Icons.rate_review_rounded;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Container(
      child: Column(
        children: [
          AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255, 4, 56, 71),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 50),
          // Container(
          //   margin: EdgeInsets.only(top: 30),
          //   width: 220,
          //   height: 130,
          //   child: logoWidget(evaliaLogo),
          // ),
          Image(
            image: AssetImage(tFullEvaliaImage),
            width: 300,
          ),
          SizedBox(
            height: 20,
          ),
          EvaliaTitleText(
              text: slogan, fontWeight: FontWeight.bold, fontSize: 24),
          SizedBox(height: 150),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    updateIndex(1); // Navigate to RatingsPage
                  },
                  icon: Icon(iconRatings),
                  label: Text('Ratings'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: TextStyle(fontSize: 20),
                    backgroundColor: Color.fromARGB(200, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed: () {
                    updateIndex(2); // Navigate to IndicatorsPage
                  },
                  icon: Icon(iconIndicators),
                  label: Text('Indicators'),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(fontSize: 20),
                      backgroundColor: Color.fromARGB(200, 255, 255, 255)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
