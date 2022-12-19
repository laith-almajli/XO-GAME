import 'dart:math';

class Player {
  static List playerX = [];
  static List playerO = [];
}

extension ContainsAll on List {
  bool containsAllx(int x, int y, [z]) {
    if (z == null) {
      return Player.playerX.contains(x) && Player.playerX.contains(y);
    } else {
      return Player.playerX.contains(x) &&
          Player.playerX.contains(y) &&
          Player.playerX.contains(z);
    }
  }

  bool containsAllo(int x, int y, [z]) {
    if (z == null) {
      return Player.playerO.contains(x) && Player.playerO.contains(y);
    } else {
      return Player.playerO.contains(x) &&
          Player.playerO.contains(y) &&
          Player.playerO.contains(z);
    }
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == 'X') {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  checkWinner() {
    String winner = '';
    if (Player.playerX.containsAllx(0, 1, 2) ||
        Player.playerX.containsAllx(3, 4, 5) ||
        Player.playerX.containsAllx(6, 7, 8) ||
        Player.playerX.containsAllx(0, 3, 6) ||
        Player.playerX.containsAllx(1, 4, 7) ||
        Player.playerX.containsAllx(2, 5, 8) ||
        Player.playerX.containsAllx(0, 4, 8) ||
        Player.playerX.containsAllx(2, 4, 6)) {
      winner = 'X';
    } else if (Player.playerO.containsAllo(0, 1, 2) ||
        Player.playerO.containsAllo(3, 4, 5) ||
        Player.playerO.containsAllo(6, 7, 8) ||
        Player.playerO.containsAllo(0, 3, 6) ||
        Player.playerO.containsAllo(1, 4, 7) ||
        Player.playerO.containsAllo(2, 5, 8) ||
        Player.playerO.containsAllo(0, 4, 8) ||
        Player.playerO.containsAllo(2, 4, 6)) {
      winner = 'O';
    } else {
      winner = '';
    }
    return winner;
  }

  autoPlay(String activePlayer) async {
    Random random = Random();
    int index = 0;
    List emptyCells = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }
    //start-center playerO
    if (Player.playerO.containsAllo(0, 1) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAllo(3, 4) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAllo(6, 7) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAllo(0, 3) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAllo(1, 4) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAllo(2, 5) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAllo(1, 4) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerO.containsAllo(2, 4) && emptyCells.contains(6)) {
      index = 6;
      //start-end playerO
    } else if (Player.playerO.containsAllo(0, 2) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAllo(3, 5) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAllo(6, 8) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerO.containsAllo(0, 6) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAllo(1, 7) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAllo(2, 8) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerO.containsAllo(0, 8) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerO.containsAllo(2, 6) && emptyCells.contains(4)) {
      index = 4;
    }
    //center-end playerO
    else if (Player.playerO.containsAllo(1, 2) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAllo(4, 5) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerO.containsAllo(7, 8) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerO.containsAllo(3, 6) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAllo(4, 7) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerO.containsAllo(5, 8) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerO.containsAllo(4, 8) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerO.containsAllo(4, 6) && emptyCells.contains(2)) {
      index = 2;
    }
    //start-center
    else if (Player.playerX.containsAllx(0, 1) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAllx(3, 4) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAllx(6, 7) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAllx(0, 3) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAllx(1, 4) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAllx(2, 5) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAllx(1, 4) && emptyCells.contains(8)) {
      index = 8;
    } else if (Player.playerX.containsAllx(2, 4) && emptyCells.contains(6)) {
      index = 6;
      //start-end
    } else if (Player.playerX.containsAllx(0, 2) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAllx(3, 5) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAllx(6, 8) && emptyCells.contains(7)) {
      index = 7;
    } else if (Player.playerX.containsAllx(0, 6) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAllx(1, 7) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAllx(2, 8) && emptyCells.contains(5)) {
      index = 5;
    } else if (Player.playerX.containsAllx(0, 8) && emptyCells.contains(4)) {
      index = 4;
    } else if (Player.playerX.containsAllx(2, 6) && emptyCells.contains(4)) {
      index = 4;
    }
    //center-end
    else if (Player.playerX.containsAllx(1, 2) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAllx(4, 5) && emptyCells.contains(3)) {
      index = 3;
    } else if (Player.playerX.containsAllx(7, 8) && emptyCells.contains(6)) {
      index = 6;
    } else if (Player.playerX.containsAllx(3, 6) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAllx(4, 7) && emptyCells.contains(1)) {
      index = 1;
    } else if (Player.playerX.containsAllx(5, 8) && emptyCells.contains(2)) {
      index = 2;
    } else if (Player.playerX.containsAllx(4, 8) && emptyCells.contains(0)) {
      index = 0;
    } else if (Player.playerX.containsAllx(4, 6) && emptyCells.contains(2)) {
      index = 2;
    } else {
      int randomIndex = random.nextInt(emptyCells.length);
      index = emptyCells[randomIndex];
    }

    playGame(index, activePlayer);
  }
}
