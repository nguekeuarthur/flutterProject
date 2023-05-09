import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper/ApiResponse.dart';
import 'package:gestachat/pages/model/Client.dart';
import 'package:gestachat/pages/services/ClientService.dart';
import '../const/style.dart';





class EditClientPage extends StatefulWidget {
  static const routeName = "/edit";
  Client client;
  EditClientPage({Key? key, required this.client});

  @override
  _EditClientPageState createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  @override
  void initState() {
    super.initState();
    Client _client = widget.client;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _sexController = TextEditingController();
  DateTime? _selectedDate;

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(picked.year, picked.month, picked.day);
        //String formattedDate = "${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
      });
      return _selectedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the client passed as an argument
    final Client client = widget.client;
    final http = ClientService();
    late APIResponse<dynamic> _apiResponse;

    // Pre-fill the form fields with the client data

    _nameController.text = client.nom as String;
    _emailController.text = client.email as String;
    _loginController.text = client.login as String;
    _passwordController.text = client.password as String;
    _sexController.text = client.sexe as String;
    _selectedDate = client.datenaiss;

    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier un client'),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context),
            child: SafeArea(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(children: [
                Text(
                  "Edit one customer ✏️",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary),
                ),
                Spacer(),
                Text(
                  "Just change values ✔️ down here 👇",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.placeholder),
                ),
                Spacer(),
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.placeholder),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColor.primary)),
                    suffixIcon: Icon(Icons.account_circle_sharp),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    isDense: true,
                  ),
                  //controller: ,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some name';
                    }
                    return null;
                  },
                  controller: _nameController,
                ),
                Spacer(),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.placeholder),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColor.primary)),
                    suffixIcon: Icon(Icons.mail),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some valid email';
                    }
                    return null;
                  },
                  controller: _emailController,
                ),
                Spacer(),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColor.primary)),
                    suffixIcon: Icon(Icons.login),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some valid sex';
                    }
                    return null;
                  },
                  controller: _sexController,
                ),
                Spacer(),
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.placeholder),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColor.primary)),
                    suffixIcon: Icon(Icons.login),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some valid login';
                    }
                    return null;
                  },
                  controller: _loginController,
                ),
                Spacer(),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.placeholder),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: AppColor.primary)),
                    suffixIcon: Icon(Icons.key),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some valid password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                ),
                Spacer(),
                Spacer(),
                Text(
                  'Selected Date: ${_selectedDate != null ? _selectedDate.toString() : 'Not Selected'}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                ),
                Spacer(),
                TextButton(
                    onPressed: () async {
                      APIResponse<dynamic> response;
                      Client monclient = new Client(
                          codeclient: widget.client.codeclient,
                          nom: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          login: _loginController.text,
                          sexe: _sexController.text,
                          datenaiss:
                              DateTime.parse(_selectedDate.toString()));
                      response = await http.updateClient(monclient);
                      print("********************************");
                      setState(() {
                        _apiResponse = response;
                        widget.client = monclient;
                      });
                      if (_apiResponse.error != true) {
                        setState(() {
                          _passwordController.text = "";
                          _nameController.text = "";
                          _emailController.text = "";
                          _sexController.text = "";
                          _loginController.text = "";
                          //_selectedDate.clear();
                        });
                      } else {
                        showErrorDialog(context);
                      }
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: AppColor.primary),
                    )),
                
              ]),
            )),
          ),
        ));
  }

  showErrorDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text('Alert!'),
      content: const Text('Edition reussi!'),
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
