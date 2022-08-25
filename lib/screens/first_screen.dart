import 'package:applicationapi/models/job_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../models/datamodel.dart';
import 'second_page.dart';
import 'dart:async';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';

class FirstScreen extends StatefulWidget {
  List<UserDetails> originalListFromAPI;
  FirstScreen(this.originalListFromAPI);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: kScaffoldBackgroundColor,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'User details',
                    style: kUserDetailsTextStyle,
                  ),
                  SizedBox(
                    height: 110,
                    width: 125,
                    child: CountDownProgressIndicator(
                      // controller: _controller,
                      valueColor: Color.fromARGB(255, 216, 111, 103),
                      backgroundColor: Color.fromARGB(255, 121, 167, 187),
                      initialPosition: 0,
                      duration: 120,
                      timeFormatter: (seconds) {
                        return Duration(seconds: seconds)
                            .toString()
                            .split('.')[0]
                            .padLeft(8, '0');
                      },
                      text: 'hh:mm:ss',
                      onComplete: () => null,
                    ),
                    // height: 100,
                    // width: 100,
                    // child: CountDownProgressIndicator(
                    //   valueColor: Color.fromARGB(255, 216, 111, 103),
                    //   backgroundColor: Color.fromARGB(255, 121, 167, 187),
                    //   initialPosition: 0,
                    //   duration: 120,
                    //   text: 'SEC',
                    //   onComplete: () => null,
                    // ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                  itemCount: widget.originalListFromAPI.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        //  widget.originalListFromAPI[index]
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                                Provider.of<JobProvider>(context)
                                        .currentSelectedUser =
                                    widget.originalListFromAPI[index]),
                          ),
                        );
                      },
                      title: Text(
                        widget.originalListFromAPI[index].name.first,
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
