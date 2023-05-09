import 'package:flutter/foundation.dart';

import 'Client.dart';
import 'Produit.dart';

class Achat {
  final int id;
  final Produit produit;
  final Client client;
  final int quantite;
  final DateTime date;

  Achat({
    required this.id,
    required this.produit,
    required this.client,
    required this.quantite,
    required this.date,
  });

  factory Achat.fromJson(Map<String, dynamic> json) {
    return Achat(
      id: json['id'],
      produit: Produit.fromJson(json['produit']),
      client: Client.fromJson(json['client']),
      quantite: json['quantite'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'produit': produit.toJson(),
    'client': client.toJson(),
    'quantite': quantite,
    'date': date.toIso8601String(),
  };
}
