import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestachat/pages/model/Produit.dart';
import 'package:gestachat/pages/services/ProduitService.dart';
import '../helper/ApiResponse.dart';
import 'package:gestachat/pages/model/Client.dart';
import 'package:gestachat/pages/services/ClientService.dart';
import '../const/style.dart';





class EditProduitPage extends StatefulWidget {
  static const routeName = "/edit";
  Produit produit;
  EditProduitPage({Key? key, required this.produit});

  @override
  _EditProduitPageState createState() => _EditProduitPageState();
}

class _EditProduitPageState extends State<EditProduitPage> {
  @override
  void initState() {
    super.initState();
    Produit _produit = widget.produit;
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
    final Produit produit = widget.produit;
    final http = ProduitService();
    late APIResponse<dynamic> _apiResponse;

    // Pre-fill the form fields with the client data

    _nameController.text = produit.label as String;
    _nameController.text = produit.codeproduit as String;
    _nameController.text = produit.pu as String;
    _nameController.text = produit.qteseuil as String;
    _nameController.text = produit.qtestock as String;
   

    return Scaffold(
        appBar: AppBar(
          title: Text('Modifier un produit'),
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
                  "Edit one produit ✏️",
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
                  "label",
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
                      return 'entrer son label';
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
                      return 'Please son codeproduit';
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
                      return 'Please son pu';
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
                      return 'Please entrer son qtestock';
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
                      return 'Please enter son qteseuil';
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
                      Produit monproduit = new Produit(
                          codeproduit: widget.produit.codeproduit,
                          label: widget.produit.label,
                          pu: widget.produit.pu,
                          qteseuil: widget.produit.qteseuil,
                          qtestock: widget.produit.qtestock,

                           );
                      response = await http.updateProduit(monproduit);
                      print("********************************");
                      setState(() {
                        _apiResponse = response;
                        widget.produit = monproduit;
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
