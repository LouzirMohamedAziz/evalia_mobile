import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../reusable/custom_dropdown_textfield.dart';

class SectorIndicatorsPage extends StatefulWidget {
  @override
  State<SectorIndicatorsPage> createState() => _SectorIndicatorsPageState();
}

class _SectorIndicatorsPageState extends State<SectorIndicatorsPage> {
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
                    height: 70,
                  ),
                  Text("Consulting Form",
                      style: TextStyle(
                        color: mainEvaliaColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 120,
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
                    height: 10,
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
                ],
              ))
        ],
      ),
    );
  }
}
