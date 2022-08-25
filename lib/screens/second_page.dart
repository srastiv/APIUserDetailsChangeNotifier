import 'package:applicationapi/models/job_provider.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/datamodel.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  UserDetails originalListFromAPI;
  UserPage(this.originalListFromAPI);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${Provider.of<JobProvider>(context).currentSelectedUser!.name.first}'s details",
          style: TextStyle(fontFamily: "Pacifico", fontSize: 27),
        ),
        backgroundColor: Color.fromARGB(255, 143, 184, 218),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: kScaffoldBackgroundColor,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: ListTile(
                  title: Text(
                    '${Provider.of<JobProvider>(context).currentSelectedUser!.name.first.toString()} ${Provider.of<JobProvider>(context).currentSelectedUser!.name.last.toString()}',
                  ),

                  // '${widget.originalListFromAPI.name.first.toString()} ${widget.originalListFromAPI.name.last.toString()}'),
                  trailing: Text(
                    widget.originalListFromAPI.cell.toString(),
                  ),
                  //  subtitle: Text(''),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
