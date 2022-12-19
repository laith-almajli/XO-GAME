// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activePlayer = 'X';

  int turn = 0;
  String result = '';
  Game game = Game();
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SwitchListTile.adaptive(
              title: const Text(
                'Two Player',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              value: isSwitch,
              onChanged: (bool newValue) {
                setState(() {
                  isSwitch = newValue;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'It\'s $activePlayer Turn'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                children: List.generate(
                  9,
                  (index) => InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: result == '' ? () => _OnTap(index) : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).shadowColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          Player.playerX.contains(index)
                              ? 'X'
                              : Player.playerO.contains(index)
                                  ? 'O'
                                  : '',
                          style: TextStyle(
                              color: Player.playerX.contains(index)
                                  ? Colors.red
                                  : Colors.white,
                              fontSize: 50),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              result.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  activePlayer = 'X';

                  turn = 0;
                  result = '';
                  Player.playerX = [];
                  Player.playerO = [];
                });
              },
              icon: const Icon(Icons.repeat),
              label: const Text(
                'Repeat The Game',
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).splashColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _OnTap(int index) async {
    if ((!Player.playerX.contains(index) || Player.playerX.isEmpty) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();

      if (!isSwitch && turn != 9) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = game.checkWinner();
      if (winnerPlayer != '') {
        result = '$winnerPlayer is the winner';
      } else if (turn == 9) {
        result = 'It\'s Draw';
      } else {
        result = '';
      }
    });
  }
}
