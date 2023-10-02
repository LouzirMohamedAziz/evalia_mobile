import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/controllers/rating_controller.dart';
import 'package:namer_app/entities/professiona.dart';

import '../../constants/colors.dart';
import '../../reusable/custom_dropdown_textfield.dart';

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
    final controller = Get.put(RatingController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text("Ratings Form",
                        style: TextStyle(
                          color: mainEvaliaColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 60,
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
                    // CustomDropdownTextField(
                    //   text: 'Territorial scale',
                    //   icon: Icons.category,
                    //   dropdownItems: ['National', 'Regional', 'Local'],
                    //   selectedValue: _territorialScaleTextController.text,
                    //   onChanged: (newValue) {
                    //     _territorialScaleTextController.text = newValue ?? '';
                    //   },
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDropdownTextField(
                      text: 'Sector',
                      icon: Icons.add_shopping_cart_outlined,
                      dropdownItems: [
                        'Health',
                        'Governance',
                        'Defense',
                        'Culture',
                        'Food',
                        'Transportation',
                        'Automobile',
                        'Telco',
                        'Technology'
                      ],
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
                      dropdownItems: [
                        'Tunisia',
                        'Algeria',
                        'Morocco',
                        'France',
                        'England',
                        'Italia',
                        'Belgium'
                      ],
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
                      dropdownItems: [
                        'Tunis',
                        'Ariana',
                        'Ben Arous',
                        'Nabeul',
                        'Bizerte',
                        'El Kef',
                        'Sousse',
                        'Sfax'
                      ],
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
                      height: 30,
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
                                    builder: (context) =>
                                        RatingsSearchResultsPage(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.loop),
                              label: Text('Search'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mainEvaliaColor,
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                  ))),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class RatingsSearchResultsPage extends StatefulWidget {
  @override
  _RatingsSearchResultsPageState createState() =>
      _RatingsSearchResultsPageState();
}

class _RatingsSearchResultsPageState extends State<RatingsSearchResultsPage> {
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
