import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:volleyball_rotations/components/Player.dart';
import 'package:volleyball_rotations/components/RoundedButton.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:volleyball_rotations/components/Player.dart';

class CourtScreen extends StatefulWidget {
  static const String id = 'court_screen';

  @override
  _CourtScreenState createState() => _CourtScreenState();
}

class _CourtScreenState extends State<CourtScreen> {
  final _auth = FirebaseAuth.instance;
  bool successfulDrop = false;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildDragTarget(players[2]),
                buildDragTarget(players[3]),
                buildDragTarget(players[4])
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildDragTarget(players[1]),
                buildDragTarget(players[0]),
                buildDragTarget(players[5])
              ],
            ),
            SizedBox(
              height: 100,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  buildDragTarget(players[14]),
                  buildDragTarget(players[13]),
                  buildDragTarget(players[12]),
                  buildDragTarget(players[11]),
                  buildDragTarget(players[10]),
                  buildDragTarget(players[9]),
                  buildDragTarget(players[8]),
                  buildDragTarget(players[7]),
                  buildDragTarget(players[6]),
                ],
              ),
            ),
            new RoundedButton(
                colour: Colors.blueAccent.shade700,
                title: 'Rotate',
                onPressed: () {
                  setState(() {
                    rotatePlayers();
                  });
                }),
          ],
        ),
      ),
    );
  }

  Draggable<Player> buildDraggable(Player player) {
    return new Draggable(
      data: player,
      child: Column(
        children: <Widget>[
          Image.asset('images/${player.gender}.png', height: 80),
          Text(
            '${player.lastName}',
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
      feedback: Column(
        children: <Widget>[
          Image.asset('images/${player.gender}.png', height: 80),
          Text(
            '${player.lastName}',
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
      childWhenDragging: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 80,
          width: 64,
        ),
      ),
    );
  }

  rotatePlayers() {
    players.insert(0, players.last);
    players.removeLast();
  }

  DragTarget<Player> buildDragTarget(Player player) {
    Player positionHolder = player;
    return new DragTarget(
      builder: (BuildContext context, List<Player> incoming, List rejected) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildDraggable(positionHolder),
        );
      },
      onAccept: (data) {
        setState(() {
          positionHolder = data;
          for (var j = 0; j < players.length; j++) {
            if (players[j].number == data.number) {
              players.removeAt(j);
              break;
            }
          }
          for (var i = 0; i < players.length; i++) {
            if (players[i].number == player.number) {
              players.insert(i, data);
              break;
            }
          }

          print('accepted');
          print(positionHolder.lastName);
        });
      },
    );
  }
}
