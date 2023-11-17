import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:namer_app/entities/user.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/sizes.dart';
import '../../constants/texts.dart';
import '../../controllers/profile_controller.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(tEditProfile,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder<User>(
            // Specify the type of data expected from the future
            future: controller
                .getUserData(), // Adjust this to your data fetching method
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  User userData = snapshot.data
                      as User; // Access the data from the snapshot
                  return Column(
                    children: [
                      // -- IMAGE with ICON
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  Image.asset(tProfileImage), // Removed 'const'
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: tPrimaryColor,
                              ),
                              child: Icon(
                                LineAwesomeIcons.camera,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      // -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: InputDecoration(
                                labelText:
                                    tFullName, // Changed 'label' to 'labelText'
                                prefixIcon: Icon(LineAwesomeIcons.user),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    tEmail, // Changed 'label' to 'labelText'
                                prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    tPhoneNo, // Changed 'label' to 'labelText'
                                prefixIcon: Icon(LineAwesomeIcons.phone),
                              ),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText:
                                    tPassword, // Changed 'label' to 'labelText'
                                prefixIcon: Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  icon: Icon(LineAwesomeIcons.eye_slash),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            const SizedBox(height: tFormHeight),

                            // -- Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle form submission
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: StadiumBorder(),
                                ),
                                child: Text(
                                  tEditProfile,
                                  style: TextStyle(color: tDarkColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: tFormHeight),

                            // -- Created Date and Delete Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "tJoined",
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                        text: "tJoinedAt",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle delete button press
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: StadiumBorder(),
                                    side: BorderSide.none,
                                  ),
                                  child: Text("tDelete"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                // You can return a loading indicator or an empty container here
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
