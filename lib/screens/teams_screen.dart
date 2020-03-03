import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:volleyball_rotations/components/TeamCard.dart';
import 'package:volleyball_rotations/screens/home_screen.dart';
import 'package:volleyball_rotations/screens/team_view_screen.dart';
import 'package:volleyball_rotations/screens/welcome_screen.dart';

class TeamsScreen extends StatefulWidget {
  static const String id = 'teams_screen';

  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
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
            Expanded(
              child: TeamCard(
                colour: Colors.blueAccent,
                cardChild: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Big Dig Energy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onPress: () {
                  Navigator.pushNamed(context, TeamViewScreen.id);
                },
              ),
            ),
            Expanded(
              child: TeamCard(
                colour: Colors.blueAccent,
                cardChild: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Bigger Dig Energy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onPress: () {
                  Navigator.pushNamed(context, TeamViewScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
