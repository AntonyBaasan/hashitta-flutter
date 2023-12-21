import 'package:flutter/material.dart';

class RunRecord {
  String? id;
  final Duration time;
  final DateTime createdAt;
  final String category;
  String? runner;

  RunRecord(
      {this.id,
      required this.time,
      required this.createdAt,
      this.runner,
      required this.category});

  factory RunRecord.fromJson(Map<String, dynamic> json) => new RunRecord(
      id: json["id"],
      time: json["time"],
      createdAt: json["createdAt"],
      runner: json["runner"],
      category: json["category"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "createdAt": createdAt,
        "runner": runner,
        "category": category
      };
}
