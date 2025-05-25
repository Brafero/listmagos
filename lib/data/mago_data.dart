import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/mago.dart';

class MagoData {
  static Future<List<Mago>> carregarMagos() async {
    final String response = await rootBundle.loadString('assets/magos.json');
    final data = await json.decode(response);
    return (data['magos'] as List).map((json) => Mago.fromJson(json)).toList();
  }
}
