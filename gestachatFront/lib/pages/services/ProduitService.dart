import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:gestachat/pages/helper/ApiResponse.dart';
import 'package:gestachat/pages/model/Client.dart';

import '../model/Produit.dart';


class ProduitService {
  static const API = 'http://127.0.0.1:8009/';
  static const ConnectClientAPI = 'http://127.0.0.1:8009/produit';
  static const headers = {
    'Content-Type': 'application/json',
    "Accept": 'application/json'
  };

  Future<APIResponse<dynamic>> createClient(Client client) async {
    var url = Uri.parse(ConnectClientAPI+"/createproduit");
    return http
        .post(url, headers: headers, body: jsonEncode(client))
        .then((data) {
      final int statueCode = data.statusCode;
      if (statueCode == 200) {
        Map<String, dynamic> jsonData = json.decode(data.body);

        Produit produitCreated = Produit(
          
          codeproduit: jsonData["codeproduit"],
          pu: jsonData["pu"],
          label: jsonData["label"],
          qtestock: jsonData["qtestock"],
          qteseuil: jsonData["qteseuil"],
     
        );
       
        return APIResponse<Produit>(
            data: produitCreated, errorMessage: '', error: false);
      } else {
        return APIResponse<String>(
            error: true, errorMessage: 'An error occured', data: "");
      }
    }).catchError((_) => APIResponse<String>(
            error: true,
            errorMessage: 'Unable to contact the server',
            data: ""));
  }

  static const String apiUrl = 'http://localhost:8009/produit/all';

  static Future<List> getItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<APIResponse<dynamic>> updateProduit(Produit produit) async {
    var url = Uri.parse(ConnectClientAPI+"/editproduit");
    return http
        .post(url, headers: headers, body: jsonEncode(produit))
        .then((data) {
      final int statueCode = data.statusCode;
      if (statueCode == 200) {
        Map<String, dynamic> jsonData = json.decode(data.body);

        Produit produitCreated = Produit(
          codeproduit: jsonData["codeproduit"] as int,
          pu: jsonData["pu"],
          label: jsonData["label"],
          qtestock: jsonData["qtestock"],
          qteseuil: jsonData["qteseuil"],
        );
       
        return APIResponse<Produit>(
            data: produitCreated, errorMessage: '', error: false);
      } else {
        return APIResponse<String>(
            error: true, errorMessage: 'An error occured', data: "");
      }
    }).catchError((_) => APIResponse<String>(
            error: true,
            errorMessage: 'Unable to contact the server',
            data: ""));
  }

  Future<APIResponse<dynamic>> deleteProduit(Produit produit) async {
    var url = Uri.parse(ConnectClientAPI+"/deleteproduit");
    return http
        .post(url, headers: headers, body: jsonEncode(produit))
        .then((data) {
      final int statueCode = data.statusCode;
      if (statueCode == 200) {
        Map<String, dynamic> jsonData = json.decode(data.body);

        Produit produitCreated = Produit(
          codeproduit: jsonData["codeproduit"] as int,
          label: jsonData["label"],
          pu: jsonData["pu"],
          qteseuil: jsonData["qteseuil"],
          qtestock: jsonData["qtestock"],

        );
       
        return APIResponse<Produit>(
            data: produitCreated, errorMessage: '', error: false);
      } else {
        return APIResponse<String>(
            error: true, errorMessage: 'An error occured', data: "");
      }
    }).catchError((_) => APIResponse<String>(
            error: true,
            errorMessage: 'Unable to contact the server',
            data: ""));
  }

}
