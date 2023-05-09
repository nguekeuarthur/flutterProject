import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestachat/pages/helper/ApiResponse.dart';
import 'package:gestachat/pages/model/data_model.dart';
import 'package:gestachat/pages/cubit/app_cubit.dart';
import 'package:gestachat/pages/cubit/app_cubit_logics.dart';
import 'package:gestachat/pages/cubit/app_cubit_state.dart';
import 'package:gestachat/pages/screens/editClientPage.dart';
import 'package:gestachat/pages/services/ClientService.dart';
import 'package:gestachat/pages/services/data_services.dart';
import 'package:gestachat/pages/model/Client.dart';




class ListTask extends StatefulWidget {
    static const routeName = "/mylistview";
  const ListTask({Key? key}) : super(key: key);

  @override
  _ListTaskState createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final items = await ClientService.getItems();
    setState(() {
      _items = items;
    });
  }

  void _navigateToEditPage(BuildContext context, Client client) async {
    await Navigator.pushNamed(context, EditClientPage.routeName,
        arguments: client);
    setState(() {
      // Rebuild the list view after the edit page is popped
      _fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  ListTile(
                    title: Text(_items[index]['nom']),
                    //subtitle: Text(_items[index]['email']),
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
                                Client client = new Client(
                                  codeclient: _items[index]['codeclient'],
                                  nom: _items[index]['nom'],
                                  email: _items[index]['email'],
                                  password: _items[index]['password'],
                                  login: _items[index]['login'],
                                  sexe: _items[index]['sexe'],
                                  datenaiss: DateTime.parse(
                                      _items[index]['datenaiss']),
                                );

                                AskPermissionToDelete(context, client);
                              },
                              child: Text('Supprimer'),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Mettre ici la logique de modification
                                //Navigator.of(context).pop();
                                Client client = new Client(
                                  codeclient: _items[index]['codeclient'],
                                  nom: _items[index]['nom'],
                                  email: _items[index]['email'],
                                  password: _items[index]['password'],
                                  login: _items[index]['login'],
                                  sexe: _items[index]['sexe'],
                                  datenaiss: DateTime.parse(
                                      _items[index]['datenaiss']),
                                );
                                /*Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return EditClientPage(client: client);
                                }));*/
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                       EditClientPage(client : client),
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

  AskPermissionToDelete(BuildContext context, Client client) {
    AlertDialog alert = AlertDialog(
      title: const Text('Alert!'),
      content: const Text('Etes-vous sur de vouloir supprimer ?'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            APIResponse<dynamic> response;
            final http = ClientService();
            late APIResponse<dynamic> _apiResponse;
            response = await http.deleteClient(client);
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
