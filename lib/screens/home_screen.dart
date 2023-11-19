import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/data/bearer_token.dart';
import 'package:namer_app/data/country_api.dart';
import 'package:namer_app/screens/sign_in_sign_up/sign_in.dart';

import '../constants/images.dart';
import '../constants/texts.dart';
import '../entities/country.dart';
import '../reusable/evalia_main_title.dart';
import 'profile/profile_screen.dart';
import 'ratings/indicators_screen.dart';
import 'ratings/quick_rate.dart';
import 'ratings/ratings_screen.dart';

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
      QuickRatePage(),
      ProfilePage(),
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
            icon: Icon(Icons.add),
            label: 'Quick Rate',
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

class WelcomePage extends StatefulWidget {
  final int currentIndex;
  final Function(int) updateIndex;

  WelcomePage({required this.currentIndex, required this.updateIndex});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late List<Country> countriesList = [];
  late String bearerToken;

  // Future<void> _refreshList() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    fetchBearerToken();
  }

  Future<void> fetchBearerToken() async {
    try {
      bearerToken = await BearerToken.getBearerToken();
      if (bearerToken.isNotEmpty) {
        getCountriesFromApi();
      } else {
        print('Bearer token is empty or not available');
      }
    } catch (e) {
      print('Error fetching bearer token: $e');
    }
  }

  void getCountriesFromApi() async {
    try {
      final response = await CountryApi.getCountries(bearerToken);
      setState(() {
        countriesList = response;
      });
    } catch (error) {
      print('Error fetching countries: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Image(
            image: AssetImage(tFullEvaliaImage),
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          EvaliaTitleText(
            text: slogan,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: countriesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(countriesList[index].name),
                  subtitle: Text(countriesList[index].isoCode),
                  leading: CircleAvatar(backgroundColor: Colors.blue),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
