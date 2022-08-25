import 'package:applicationapi/data/network_helper.dart';
import 'package:applicationapi/models/datamodel.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:applicationapi/models/job_provider.dart';
import 'package:applicationapi/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JobProvider(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        title: 'Flutter Demo',
        home: FutureBuilder<List<UserDetails>>(
          future: getUserData(),
          builder: (context, AsyncSnapshot<List<UserDetails>> snapshot) {
            if (snapshot.hasError) {
              return Container(
                child: kAPIError,
              );
            } else if (snapshot.hasData) {
              return AnimatedSplashScreen(
                  duration: 1000,
                  splash:
                      // Icon(Icons.home),
                      Image.asset(
                    'assets/images/bubble.jpeg',
                  ),
                  nextScreen: FirstScreen(snapshot.data!),
                  splashTransition: SplashTransition.fadeTransition,
                  backgroundColor: Color.fromARGB(255, 141, 188, 200));

              // FirstScreen(snapshot.data!);

            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
