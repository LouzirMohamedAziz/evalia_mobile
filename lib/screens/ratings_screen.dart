import 'package:flutter/material.dart';
import 'package:namer_app/models/professional.dart';

class RatingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardTextStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 255, 255, 255),
    );

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 132, 202, 240),
        Color.fromARGB(255, 53, 135, 206),
        Color.fromARGB(255, 7, 106, 160),
        Color.fromARGB(255, 13, 58, 82)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 14, 61, 92), // Border color
                ),
                borderRadius:
                    BorderRadius.circular(8), // Adjust border radius as needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Select Actor by:',
                  style: cardTextStyle,
                  semanticsLabel: 'Actors Criteria',
                ),
              ),
            ),
          ),
          Column(
            children: [
              SearchCriteriaTextField(label: 'Actor Name'),
              SearchCriteriaTextField(label: 'Sector'),
              SearchCriteriaTextField(label: 'Sub-sector'),
              SearchCriteriaTextField(label: 'Country'),
              SearchCriteriaTextField(label: 'Governorate'),
              SearchCriteriaTextField(label: 'Delegation'),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchResultsPage(),
                        ),
                      );
                    },
                    icon: Icon(Icons.loop),
                    label: Text('Search'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 63, 115, 141),
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        textStyle: TextStyle(
                          fontSize: 20,
                        ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchCriteriaTextField extends StatelessWidget {
  final String label;

  const SearchCriteriaTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 255, 255, 255),
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class SearchResultsPage extends StatefulWidget {
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  List<Professional> searchResults =
      []; // Populate this list with search results

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 162, 209, 233),
      appBar: AppBar(
        title: Text('Search Results'),
        backgroundColor: Color.fromARGB(255, 1, 2, 3),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index].name),
            // ... Other actor information
          );
        },
      ),
    );
  }
}
