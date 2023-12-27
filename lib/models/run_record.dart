import 'package:intl/intl.dart';

class RunRecord {
  String? id;
  final Duration duration;
  final DateTime createdAt;
  final String category;
  String? runner;
  String get dayOfRun => DateFormat.yMMMd().format(createdAt).toString();

  RunRecord(
      {this.id,
      required this.duration,
      required this.createdAt,
      this.runner,
      required this.category});

  factory RunRecord.fromJson(Map<String, dynamic> json) => new RunRecord(
      id: json["id"],
      duration: Duration(seconds: json["duration"]),
      createdAt: DateTime.parse(json["createdAt"]),
      runner: json["runner"],
      category: json["category"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "duration": duration.inSeconds,
        "createdAt": createdAt.toIso8601String(),
        "runner": runner,
        "category": category
      };
}
