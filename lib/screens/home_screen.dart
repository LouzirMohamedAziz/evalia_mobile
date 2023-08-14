import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/authentication/sign_in.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'indicators_screen.dart';
import 'ratings_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [WelcomePage(), RatingsPage(), IndicatorsPage()];

  @override
  Widget build(BuildContext context) {
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
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 170, 214, 238),
        backgroundColor: Color.fromARGB(255, 13, 58, 82),
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
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 132, 202, 240),
        Color.fromARGB(255, 53, 135, 206),
        Color.fromARGB(255, 7, 106, 160),
        Color.fromARGB(255, 13, 58, 82)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(children: [
        AppBar(
          title: Text('Welcome to Evalia'),
          titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 205, 234, 243), fontSize: 30),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 92, 173, 216),
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Color.fromARGB(255, 205, 234, 243),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                });
              },
            ),
          ],
        ),
        Expanded(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(pair: pair),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      appState.toggleFavorite();
                    },
                    icon: Icon(icon),
                    label: Text('Like'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      appState.getNext();
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ))
      ]),
    );
  }
}
