import 'package:flutter/material.dart';

// ignore: camel_case_types
class Periotica {
  final String issn;
  final String? periodico;
  final String? extratoCAPES;

  const Periotica({
    required this.issn,
    @required this.periodico,
    this.extratoCAPES,
  });
}
