import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:volleyball_rotations/components/RoundedButton.dart';
import 'package:volleyball_rotations/components/TeamCard.dart';
import 'package:volleyball_rotations/screens/home_screen.dart';
import 'package:volleyball_rotations/screens/player_add_screen.dart';
import 'package:volleyball_rotations/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:volleyball_rotations/constants.dart';
import 'package:volleyball_rotations/components/Player.dart';
import 'court_screen.dart';

final _firestore = Firestore.instance;

class TeamViewScreen extends StatefulWidget {
  static const String id = 'team_view_screen';

  @override
  _TeamViewScreenState createState() => _TeamViewScreenState();
}

class _TeamViewScreenState extends State<TeamViewScreen> {
  final _auth = FirebaseAuth.instance;

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
              height: 20,
            ),
            Flexible(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(players[index].lastName);
                    },
                    child: Container(
                      height: 50,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          '${players[index].firstName} ${players[index].lastName}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Add Player',
              onPressed: () {
                Navigator.pushNamed(context, PlayerAddScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
