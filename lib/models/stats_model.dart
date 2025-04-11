import 'dart:convert';

class Stats {
  final String level;
  final int time;
  final int correctAnswers;

  Stats({
    required this.level,
    required this.time,
    required this.correctAnswers,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      level: json['level'],
      time: json['time'],
      correctAnswers: json['correctAnswers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'time': time,
      'correctAnswers': correctAnswers,
    };
  }
}
