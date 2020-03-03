import 'package:flutter/material.dart';
import 'package:volleyball_rotations/constants.dart';

class Player {
  Player(
      {@required this.firstName,
      @required this.lastName,
      @required this.number,
      this.gender});

  final String firstName;
  final String lastName;
  final int number;
  final String gender;

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  int getNumber() {
    return number;
  }

  String getGender() {
    return gender;
  }
}

//import 'package:flutter/material.dart';
//import 'package:volleyball_rotations/constants.dart';
//
//class Player extends StatelessWidget {
//  Player(
//      {@required this.firstName,
//        @required this.lastName,
//        @required this.number,
//        this.gender});
//
//  final String firstName;
//  final String lastName;
//  final int number;
//  final String gender;
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        Image.asset('images/$gender.png', height: 80),
//        Text(
//          '$lastName',
//          style: Theme.of(context).textTheme.body1,
//        ),
//      ],
//    );
//  }
//}
