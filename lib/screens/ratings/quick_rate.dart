import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:namer_app/controllers/actor_controller.dart';
import 'package:namer_app/controllers/rating_controller.dart';
import 'package:namer_app/entities/actor.dart';

import '../../constants/colors.dart';

class QuickRatePage extends StatefulWidget {
  const QuickRatePage({Key? key});

  @override
  State<QuickRatePage> createState() => _QuickRatePageState();
}

class _QuickRatePageState extends State<QuickRatePage> {
  final actorController = TextEditingController();

  static const List<String> listItems = <String>['Apple', 'Banana', 'Peach'];
  late final TextEditingController _ratingController;
  late double _rating;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;
  IconData? _selectedIcon;
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    final ratingController = Get.put(RatingController());
    final actorController = Get.put(ActorController());
    final performanceController = TextEditingController();
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text("Quick Rate",
                    style: TextStyle(
                      color: mainEvaliaColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Actor",
                        style: TextStyle(
                            color: mainEvaliaColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outlined,
                          color: mainEvaliaColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FutureBuilder<List<Actor>>(
                            future: actorController.getAllActors(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(
                                  color: tWhiteColor,
                                ); // You can replace this with a loading indicator
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return AutoCompleteTextField<Actor>(
                                  key: GlobalKey<
                                      AutoCompleteTextFieldState<Actor>>(),
                                  clearOnSubmit: false,
                                  suggestions: snapshot.data!,
                                  itemFilter: (item, query) {
                                    return item.name
                                        .toLowerCase()
                                        .contains(query.toLowerCase());
                                  },
                                  itemSorter: (a, b) {
                                    return a.name.compareTo(b.name);
                                  },
                                  itemSubmitted: (item) {
                                    setState(() {
                                      actorController.createActor(item);
                                      selectedValue = item.name;
                                    });
                                  },
                                  itemBuilder: (context, item) {
                                    return Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(item.name),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Performance",
                        style: TextStyle(
                            color: mainEvaliaColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.perm_data_setting_outlined,
                          color: mainEvaliaColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropDownTextField(
                            enableSearch: true,
                            dropDownList: const [
                              DropDownValueModel(
                                  name: 'Economical', value: "value1"),
                              DropDownValueModel(
                                  name: 'Social', value: "value2"),
                              DropDownValueModel(
                                  name: 'Environmental', value: "value3"),
                            ],
                            dropdownColor: Colors.white,
                            textStyle: TextStyle(
                              color: mainEvaliaTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Indicator",
                        style: TextStyle(
                            color: mainEvaliaColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.rate_review_outlined,
                          color: mainEvaliaColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropDownTextField(
                            enableSearch: true,
                            dropDownList: const [
                              DropDownValueModel(
                                  name: 'Economical', value: "value1"),
                              DropDownValueModel(
                                  name: 'Social', value: "value2"),
                              DropDownValueModel(
                                  name: 'Environmental', value: "value3"),
                            ],
                            dropdownColor: Colors.white,
                            textStyle: TextStyle(
                              color: mainEvaliaTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Rating",
                        style: TextStyle(
                            color: mainEvaliaColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    RatingBarIndicator(
                      rating: _userRating,
                      itemBuilder: (context, index) => Icon(
                        _selectedIcon ?? Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 45.0,
                      unratedColor: Colors.amber.withAlpha(50),
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Comment",
                        style: TextStyle(
                            color: mainEvaliaColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    TextField(
                      maxLines: 1,
                      style: TextStyle(
                        color: mainEvaliaTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Attachments",
                        style: TextStyle(
                            color: mainEvaliaColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  // Future<List<DropDownValueModel>> getSuggestions() async {

  //   List<DropDownValueModel> suggestions = [];
  //   QuerySnapshot querySnapshot =
  //       await FirebaseFirestore.instance.collection('actors').get();
  //   querySnapshot.docs.forEach((doc) {
  //     suggestions
  //         .add(DropDownValueModel(name: doc['name'], value: doc['name']));
  //   });
  //   return suggestions;
  // }
}
