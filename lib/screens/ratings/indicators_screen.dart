import 'package:flutter/material.dart';
import 'package:namer_app/entities/sector.dart';

import '../../constants/colors.dart';
import '../../reusable/custom_dropdown_textfield.dart';

class IndicatorsPage extends StatefulWidget {
  @override
  State<IndicatorsPage> createState() => _IndicatorsPageState();
}

class _IndicatorsPageState extends State<IndicatorsPage> {
  final TextEditingController _territoryTextController =
      TextEditingController();
  final TextEditingController _displayTypeTextController =
      TextEditingController();
  final TextEditingController _sectorNameTextController =
      TextEditingController();
  final TextEditingController _performanceTextController =
      TextEditingController();
  final TextEditingController _governorateTextController =
      TextEditingController();
  final TextEditingController _temporalityTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final cardTextStyle = TextStyle(
    //   fontSize: 24,
    //   fontWeight: FontWeight.bold,
    //   color: Color.fromARGB(255, 255, 255, 255),
    // );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text("Indicators",
                      style: TextStyle(
                        color: mainEvaliaColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 70,
                  ),
                  CustomDropdownTextField(
                    text: 'Display Type',
                    icon: Icons.recent_actors_outlined,
                    dropdownItems: ['Chart', 'Map', 'Statistics'],
                    selectedValue: _displayTypeTextController.text,
                    onChanged: (newValue) {
                      _displayTypeTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Territory',
                    icon: Icons.category,
                    dropdownItems: ['All', 'National', 'Regional'],
                    selectedValue: _territoryTextController.text,
                    onChanged: (newValue) {
                      _territoryTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Sector(s)',
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
                    text: 'Performance',
                    icon: Icons.account_balance_outlined,
                    dropdownItems: ['Social', 'Economical', 'Environmental'],
                    selectedValue: _performanceTextController.text,
                    onChanged: (newValue) {
                      _performanceTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomDropdownTextField(
                    text: 'Indicator',
                    icon: Icons.business_outlined,
                    dropdownItems: ['QLT', 'ACCS', 'STAFF', 'ALL GR'],
                    selectedValue: _governorateTextController.text,
                    onChanged: (newValue) {
                      _governorateTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownTextField(
                    text: 'Temporality',
                    icon: Icons.location_city_outlined,
                    dropdownItems: ['2022', '2023'],
                    selectedValue: _temporalityTextController.text,
                    onChanged: (newValue) {
                      _temporalityTextController.text = newValue ?? '';
                    },
                  ),
                  SizedBox(
                    height: 95,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  IndicatorsSearchResultsPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.loop),
                        label: Text('Search'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainEvaliaColor,
                            foregroundColor: Color.fromARGB(255, 255, 255, 255),
                            textStyle: TextStyle(
                              fontSize: 20,
                            ))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class IndicatorsSearchResultsPage extends StatefulWidget {
  @override
  _IndicatorsSearchResultsPageState createState() =>
      _IndicatorsSearchResultsPageState();
}

class _IndicatorsSearchResultsPageState
    extends State<IndicatorsSearchResultsPage> {
  List<Sector> searchResults = []; // Populate this list with search results

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
