import 'package:flutter/material.dart';
import 'package:volleyball_rotations/screens/court_screen.dart';
import 'package:volleyball_rotations/screens/home_screen.dart';
import 'package:volleyball_rotations/screens/login_screen.dart';
import 'package:volleyball_rotations/screens/registration_screen.dart';
import 'package:volleyball_rotations/screens/teams_screen.dart';
import 'package:volleyball_rotations/screens/welcome_screen.dart';
import 'package:volleyball_rotations/screens/team_view_screen.dart';
import 'package:volleyball_rotations/screens/player_add_screen.dart';

void main() => runApp(VolleyballRotations());

class VolleyballRotations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        CourtScreen.id: (context) => CourtScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        TeamsScreen.id: (context) => TeamsScreen(),
        TeamViewScreen.id: (context) => TeamViewScreen(),
        PlayerAddScreen.id: (context) => PlayerAddScreen(),
      },
    );
  }
}
