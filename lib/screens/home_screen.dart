import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:volleyball_rotations/components/RoundedButton.dart';
import 'package:volleyball_rotations/screens/teams_screen.dart';
import 'package:volleyball_rotations/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volleyball_rotations/components/Player.dart';
import 'court_screen.dart';

List<Player> players = [];

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  bool playersLoaded = false;

//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    if (playersLoaded == false) {
//      playersStream();
//    }
//  }

//  void playersStream() async {
//    await for (var snapshot in _firestore.collection('players').snapshots()) {
//      for (var player in snapshot.documents) {
//        players.add(new Player(
//          firstName: player.data['firstName'],
//          lastName: player.data['lastName'],
//          number: player.data['number'],
//          gender: player.data['gender'],
//        ));
//      }
//      playersLoaded = true;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: players[1],
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.id);
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
              height: 20,
            ),
            Text(
              'Home',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            new RoundedButton(
                colour: Colors.blueAccent.shade700,
                title: 'My teams',
                onPressed: () {
                  Navigator.pushNamed(context, TeamsScreen.id);
                }),
            SizedBox(
              height: 20,
            ),
            new RoundedButton(
                colour: Colors.blueAccent,
                title: 'Create Team',
                onPressed: () {
                  Navigator.pushNamed(context, TeamsScreen.id);
                }),
            SizedBox(
              height: 20,
            ),
            new RoundedButton(
                colour: Colors.lightBlueAccent,
                title: 'View Rotations',
                onPressed: () {
                  Navigator.pushNamed(context, CourtScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
