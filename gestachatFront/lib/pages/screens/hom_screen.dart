
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestachat/pages/cubit/app_cubit.dart';
import 'package:gestachat/pages/cubit/app_cubit_logics.dart';
import 'package:gestachat/pages/cubit/app_cubit_state.dart';
import 'package:gestachat/pages/helper/ApiResponse.dart';
import 'package:gestachat/pages/screens/editProduitPage.dart';
import 'package:gestachat/pages/services/ProduitService.dart';

import '../model/Produit.dart';



class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final items = await ProduitService.getItems();
    setState(() {
      _items = items;
    });
  }

  void _navigateToEditPage(BuildContext context, Produit produit) async {
    await Navigator.pushNamed(context, EditProduitPage.routeName,
        arguments: produit);
    setState(() {
      // Rebuild the list view after the edit page is popped
      _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List View'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  ListTile(
                    title: Text(_items[index]['codeproduit'].toString()),
                  
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Que voulez-vous faire ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Annuler'),
                            ),
                            TextButton(
                              onPressed: () {
                                Produit produit = new Produit(
                                  codeproduit: _items[index]['codeproduit'],
                                  pu: _items[index]['pu'],
                                  qteseuil: _items[index]['qteseuil'],
                                  qtestock: _items[index]['qtestock'],
                                  label: _items[index]['label'],
                              
                          
                                );

                                AskPermissionToDelete(context, produit);
                              },
                              child: Text('Supprimer'),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Mettre ici la logique de modification
                                //Navigator.of(context).pop();
                                Produit produit = new Produit(
                                  codeproduit: _items[index]['codeproduit'],
                                  label: _items[index]['label'],
                                  pu: _items[index]['pu'],
                                  qteseuil: _items[index]['qteseuil'],
                                  qtestock: _items[index]['qtestock'],
                             
                            
                                );
                                /*Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return EditClientPage(client: client);
                                }));*/
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                       EditProduitPage(produit : produit),
                                  ),
                                );

                                //print(c);
                              },
                              child: Text('Modifier'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ));
        },
      ),
    );
  }

  AskPermissionToDelete(BuildContext context, Produit produit) {
    AlertDialog alert = AlertDialog(
      title: const Text('Alert!'),
      content: const Text('Etes-vous sur de vouloir supprimer ?'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            APIResponse<dynamic> response;
            final http = ProduitService();
            late APIResponse<dynamic> _apiResponse;
            response = await http.deleteProduit(produit);
            print("********************************");
            setState(() {
              _apiResponse = response;
            });
            if (_apiResponse.error != true) {
              setState(() {
                //_selectedDate.clear();
              });
            } else {
              Navigator.of(context).pop();
              showErrorDialog(context);
            }
          },
          child: const Text('Oui'),
        ),
        TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
          child: const Text('Non'),
        ),
      ],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showErrorDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text('Alert!'),
      content: const Text('Suppression Termine!'),
      actions: <Widget>[
        /*TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),*/
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
