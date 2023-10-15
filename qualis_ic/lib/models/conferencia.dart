import 'package:flutter/material.dart';

// ignore: camel_case_types
class Conferencia {
  final String sigla;
  final String? conferencia;
  final String? extratoCAPES;

  const Conferencia({
    required this.sigla,
    @required this.conferencia,
    this.extratoCAPES,
  });
}
