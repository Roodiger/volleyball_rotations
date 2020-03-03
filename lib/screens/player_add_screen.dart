import 'package:flutter/material.dart';
import 'package:volleyball_rotations/components/RoundedButton.dart';
import 'package:volleyball_rotations/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:volleyball_rotations/components/Player.dart';
import 'package:volleyball_rotations/screens/home_screen.dart';
import 'welcome_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class PlayerAddScreen extends StatefulWidget {
  static const String id = 'player_add_screen';

  @override
  _PlayerAddScreenState createState() => _PlayerAddScreenState();
}

class _PlayerAddScreenState extends State<PlayerAddScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  String firstName;
  String lastName;
  int number;
  String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                          child: Image.asset(
                            'images/logo.png',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Hero(
                      tag: 'logout',
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            _auth.signOut();
                            Navigator.pushReplacementNamed(
                                context, WelcomeScreen.id);
                          },
                          child: Image.asset(
                            'images/logout.png',
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  firstName = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your first name.'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  lastName = value;
                },
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your last name.'),
              ),
              TextField(
                onChanged: (value) {
                  number = int.parse(value);
                },
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your jersey number.'),
              ),
              TextField(
                onChanged: (value) {
                  gender = value;
                },
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your gender.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              new RoundedButton(
                  colour: Colors.blueAccent,
                  title: 'Add Player',
                  onPressed: () {
                    _firestore.collection('players').add({
                      'firstName': firstName,
                      'lastName': lastName,
                      'number': number,
                      'gender': gender,
                    });
                    players.add(new Player(
                      firstName: firstName,
                      lastName: lastName,
                      number: number,
                      gender: gender,
                    ));
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
