import 'package:counter_flutter/screens/models/player_model.dart';

class CounterModel {
  final List<int> scores;
  final List<Player> players;
  final int winningScore;
  int currentPlayerIndex;
  int currentPoints;

  CounterModel({
    required this.scores,
    required this.players,
    required this.winningScore,
    required this.currentPlayerIndex,
    required this.currentPoints,
  });

  void updateScore(int playerIndex, int score) {
    scores[playerIndex] += score;
  }

  void switchPlayer() {
    players[currentPlayerIndex].points = currentPoints;
    currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
    currentPoints = players[currentPlayerIndex].points;
  }

  void incrementPoints(int value) {
    currentPoints += value;
    players[currentPlayerIndex].points = currentPoints;
  }

  void resetPoints() {
    for (var player in players) {
      player.points = 0;
    }
    currentPoints = 0;
  }

  bool checkForWinner() {
    for (var i = 0; i < scores.length; i++) {
      if (scores[i] >= winningScore) {
        return true;
      }
    }
    return false;
  }
}
