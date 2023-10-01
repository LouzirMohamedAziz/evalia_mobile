import 'package:english_words/english_words.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/screens/sign_in.dart';
import 'package:provider/provider.dart';

import 'constants/images.dart';
import 'constants/texts.dart';
import 'firebase_options.dart';
import 'reusable/evalia_main_button.dart';
import 'reusable/evalia_main_title.dart';

// Author: Mohamed Aziz LOUZIR
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Evalia',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey, brightness: Brightness.light),
        ),
        darkTheme:
            ThemeData(brightness: Brightness.dark), // If we will use theme dark
        themeMode:
            ThemeMode.light, // in Here we choose the Theme, dark or light
        home: Scene(), // MyHomePage(), //
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class Scene extends StatelessWidget {
  const Scene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(
          30, MediaQuery.of(context).size.height * 0.1, 30, 0),
      child: Center(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image(
            //     image: AssetImage(tgroup3), // Replace with your image asset
            //     height: 200,
            //     width: 200,
            //   ),
            // )
            EvaliaTitleText(
                text: welcomeTo, fontWeight: FontWeight.bold, fontSize: 22),
            SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage(tFullEvaliaImage),
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            EvaliaTitleText(
                text: slogan, fontWeight: FontWeight.bold, fontSize: 18),
            SizedBox(
              height: 150,
            ),
            Image(
              image: AssetImage(tWelomeScreenImage),
              width: 300,
            ),
            SizedBox(
              height: 220,
            ),
            EvaliaMainButton(
              text: getStarted,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              onPress: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                )
              },
            ),
          ],
        ),
      ),
    ));
  }
}
