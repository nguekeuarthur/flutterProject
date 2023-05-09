
import 'package:flutter/material.dart';
import 'package:gestachat/pages/helper/ApiResponse.dart';
import 'package:gestachat/pages/model/Client.dart';
import 'package:gestachat/pages/screens/HomePage.dart';

import '../services/ClientService.dart';

class AddClientPage extends StatefulWidget {
  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  TextEditingController codeClientController = new TextEditingController();

  TextEditingController nomController = new TextEditingController();

  TextEditingController emailController = new TextEditingController();

  TextEditingController sexeController = new TextEditingController();

  TextEditingController loginController = new TextEditingController();

  TextEditingController passwordController = new TextEditingController();

  TextEditingController datenaisController = new TextEditingController();

  final http = ClientService();

  APIResponse<dynamic> _apiResponse = new APIResponse(errorMessage: "errorMessage", data: "data");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un client'),
        backgroundColor: Color(0xFF00A368),
      ),
      body: Form(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Code client',
                      ),
                      controller: codeClientController,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nom',
                      ),
                      controller: nomController,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      controller: emailController,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Sexe',
                      ),
                      controller: sexeController,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Login',
                      ),
                      controller: loginController,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                      ),
                      controller: passwordController,
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () async {
                        // Navigator.pushReplacementNamed(context, "HomePage");
                        APIResponse<dynamic> response;
                        Client client = new Client(
                          codeclient : int.parse(codeClientController.text),
                          nom : nomController.text,
                          email :   emailController.text,
                          sexe :   sexeController.text,
                          login :   loginController.text,
                          password :   passwordController.text,
                          datenaiss :   DateTime.parse(datenaisController.text),
                        );
                        response = await http.createClient(client);
                        setState(() {
                          _apiResponse = response;
                        });
                        if (_apiResponse.error == false) {
                          Navigator.pushReplacementNamed(context, "HomePage");
                        }
                        else {
                          setState(() {
                            codeClientController.text = _apiResponse.errorMessage;
                          });
                        }
                      },
                      child: Ink(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF00A368),
                        ),
                        child: Text(
                          "Enregistrer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ]))),
    );
  }
}
