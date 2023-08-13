import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class IndicatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(favorites[index].asPascalCase),
        );
      },
    );
  }
}
