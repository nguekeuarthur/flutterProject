import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Client {
  int codeclient;
  String nom;
  String email;
  String sexe;
  String login;
  String password;
  DateTime datenaiss;

  Client({
    required this.codeclient,
    required this.nom,
    required this.email,
    required this.sexe,
    required this.login,
    required this.password,
    required this.datenaiss,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      codeclient: json['codeclient'],
      nom: json['nom'],
      email: json['email'],
      sexe: json['sexe'],
      login: json['login'],
      password: json['password'],
      datenaiss: DateTime.parse(json['datenaiss']),
    );
  }

  Map<String, dynamic> toJson() => {
    'codeclient': codeclient,
    'nom': nom,
    'email': email,
    'sexe': sexe,
    'login': login,
    'password': password,
    'datenaiss': datenaiss.toIso8601String(),
  };



}
