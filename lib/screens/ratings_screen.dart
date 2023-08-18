import 'package:flutter/material.dart';
import 'package:namer_app/entities/professiona.dart';

import '../reusable/custom_dropdown_textfield.dart';

class RatingsPage extends StatefulWidget {
  @override
  State<RatingsPage> createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {
  final TextEditingController _territorialScaleTextController =
      TextEditingController();

  final TextEditingController _actorNameTextController =
      TextEditingController();

  final TextEditingController _actorTypeTextController =
      TextEditingController();

  final TextEditingController _sectorNameTextController =
      TextEditingController();

  final TextEditingController _subSectorNameTextController =
      TextEditingController();

  final TextEditingController _countryTextController = TextEditingController();

  final TextEditingController _governorateTextController =
      TextEditingController();

  final TextEditingController _delegationTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final cardTextStyle = TextStyle(
    //   fontSize: 24,
    //   fontWeight: FontWeight.bold,
    //   color: Color.fromARGB(255, 255, 255, 255),
    // );

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
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text("Select Actor By",
                      style: TextStyle(
                        color: Color.fromARGB(160, 255, 255, 255),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownTextField(
                    text: 'Actor Name',
                    icon: Icons.recent_actors_outlined,
                    dropdownItems: ['Type 1', 'Type 2', 'Type 3'],
                    selectedValue: _actorNameTextController.text,
                    onChanged: (newValue) {
                      _actorTypeTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Actor type',
                    icon: Icons.recent_actors_outlined,
                    dropdownItems: ['Name1', 'Name2', 'Name3'],
                    selectedValue: _actorTypeTextController.text,
                    onChanged: (newValue) {
                      _actorTypeTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Territorial scale',
                    icon: Icons.category,
                    dropdownItems: ['National', 'Regional', 'Local'],
                    selectedValue: _territorialScaleTextController.text,
                    onChanged: (newValue) {
                      _territorialScaleTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Sector',
                    icon: Icons.add_shopping_cart_outlined,
                    dropdownItems: ['Sector1', 'Sector2', 'Sector3'],
                    selectedValue: _sectorNameTextController.text,
                    onChanged: (newValue) {
                      _sectorNameTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Sub-sector',
                    icon: Icons.fork_right_sharp,
                    dropdownItems: ['SubSector1', 'SubSector2', 'SubSector3'],
                    selectedValue: _subSectorNameTextController.text,
                    onChanged: (newValue) {
                      _subSectorNameTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Country',
                    icon: Icons.account_balance_outlined,
                    dropdownItems: ['Tunisia', 'Algeria', 'Morocco'],
                    selectedValue: _countryTextController.text,
                    onChanged: (newValue) {
                      _countryTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Governorate',
                    icon: Icons.business_outlined,
                    dropdownItems: ['Tunis', 'Ariana', 'Ben Arous'],
                    selectedValue: _governorateTextController.text,
                    onChanged: (newValue) {
                      _governorateTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Delegation',
                    icon: Icons.location_city_outlined,
                    dropdownItems: ['Menzah', 'Ghazela'],
                    selectedValue: _delegationTextController.text,
                    onChanged: (newValue) {
                      _delegationTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                                backgroundColor:
                                    Color.fromARGB(255, 63, 115, 141),
                                foregroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                textStyle: TextStyle(
                                  fontSize: 20,
                                ))),
                      ),
                    ],
                  ),
                ],
              ))
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
          labelText: label,
          labelStyle: TextStyle(
            color: const Color.fromARGB(255, 199, 5, 5),
          ),
          filled: true,
          fillColor: Colors.white, // Set the background color to white
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white, // Set the border color to white
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white, // Set the border color to white
            ),
          ),
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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 132, 202, 240),
        Color.fromARGB(255, 53, 135, 206),
        Color.fromARGB(255, 7, 106, 160),
        Color.fromARGB(255, 13, 58, 82)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
