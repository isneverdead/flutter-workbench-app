import 'package:flutter/material.dart';

class Job {
  final String id;
  final String title;
  final String status;
  final String tanggal;
  final String kendala;
  Job({
    @required this.id,
    @required this.title,
    @required this.status,
    @required this.tanggal,
    @required this.kendala,
  });
}
