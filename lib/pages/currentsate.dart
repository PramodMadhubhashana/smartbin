import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CurrentSate extends StatefulWidget {
  const CurrentSate({super.key});

  @override
  State<CurrentSate> createState() => _CurrentSateState();
}

class _CurrentSateState extends State<CurrentSate> {
  final _databaseReference = FirebaseDatabase.instance.ref().child('CurrentState');
  String currentvalue = '0';

  @override
  void initState() {
    super.initState();
    _setupDatabaseListener();
  }

  void _setupDatabaseListener() {
    _databaseReference.onValue.listen((event) {
      setState(() {
        currentvalue = event.snapshot.value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 5.0,
      percent: 1.0,
      center: Text("$currentvalue %"),
      progressColor: Colors.green,
    );
  }
}
