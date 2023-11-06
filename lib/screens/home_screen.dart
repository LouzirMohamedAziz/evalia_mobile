import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/sign_in_sign_up/sign_in.dart';

import '../constants/images.dart';
import '../constants/texts.dart';
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
  static const List<String> listItems = <String>['Apple', 'Banana', 'Peach'];

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
  List<String> items = [
    'Item 3',
    'Item 3',
    'Item 3',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 1',
    'Item 2',
    'Item 3'
  ];

  Future<void> _refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshList,
      child: SingleChildScrollView(
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
            // Autocomplete<String>(
            //   optionsBuilder: (TextEditingValue (textEditingValue) {
            //     if(textEditingValue.text == '' ) {
            //       return const Iterable<String>.empty();
            //     }
            //     return listItems.where(String item) {
            //       return item.contains(textEditing)
            //     }
            //   }),
            // )
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: items.length,
            //   itemBuilder: (context, index) {
            //     final item = items[index];
            //     return ListTile(title: Text(item));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
