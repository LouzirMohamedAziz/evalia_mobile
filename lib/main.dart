import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namer_app/data/bearer_token.dart';
import 'package:namer_app/screens/sign_in_sign_up/sign_in.dart';
import 'package:provider/provider.dart';

//
// Started 01 August 2023
//
// Author: Mohamed Aziz LOUZIR
//

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  //     .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyAppState()),
        FutureProvider<String>(
          create: (context) => BearerToken.getBearerToken(),
          initialData: "", // Initial value for the bearer token
        ),
      ],
      child: GetMaterialApp(
        title: 'Evalia',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey, brightness: Brightness.light),
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.system,
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        home: SignIn(),
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

// class Scene extends StatelessWidget {
//   const Scene({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       padding: EdgeInsets.fromLTRB(
//           30, MediaQuery.of(context).size.height * 0.1, 30, 0),
//       child: Center(
//         child: Column(
//           children: [
//             // Align(
//             //   alignment: Alignment.topLeft,
//             //   child: Image(
//             //     image: AssetImage(tgroup3), // Replace with your image asset
//             //     height: 200,
//             //     width: 200,
//             //   ),
//             // )
//             EvaliaTitleText(
//                 text: welcomeTo, fontWeight: FontWeight.bold, fontSize: 22),
//             SizedBox(
//               height: 50,
//             ),
//             Image(
//               image: AssetImage(tFullEvaliaImage),
//               width: 200,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             EvaliaTitleText(
//                 text: slogan, fontWeight: FontWeight.bold, fontSize: 18),
//             SizedBox(
//               height: 150,
//             ),
//             Image(
//               image: AssetImage(tWelomeScreenImage),
//               width: 300,
//             ),
//             SizedBox(
//               height: 220,
//             ),
//             EvaliaMainButton(
//               text: getStarted,
//               fontWeight: FontWeight.w600,
//               fontSize: 18,
//               onPress: () => {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SignIn(),
//                   ),
//                 )
//               },
//             ),
//           ],
//         ),
//       ),
//     ));
//    }
// }
