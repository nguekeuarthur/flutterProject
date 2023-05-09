import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestachat/pages/cubit/app_cubit.dart';
import 'package:gestachat/pages/cubit/app_cubit_logics.dart';
import 'package:gestachat/pages/cubit/app_cubit_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gestachat/pages/model/data_model.dart';
import 'package:gestachat/pages/services/data_services.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});
final String info = "Gest Achat" ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WantaMarket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
            
        ),
        primarySwatch: Colors.grey,
      ),
     

    //  home: const BottomBar() ,
    // premiere page de l'application 
    home: BlocProvider<AppCubit>(
      create:(context) =>AppCubit(
        data: DataServices() ,
      ) ,

      child:  AppCubitLogics()

    )  ,
    );
  }
}

class soir extends StatefulWidget {
  const soir({super.key});

  @override
  State<soir> createState() => _soirState();
}

class _soirState extends State<soir> {

var info = "Gest Achat market" ;
 String value = "";
void onclick() {
  setState(() {
     value= " Produit ajoutez dans le panier avec succes " ;
  });
}

void onclick2(String value2) {
  setState(() {
    String value= "Retour dans votre boutique " ;
  });
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    info = "Bienvenue sur Super SAS";
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title :  Text("Raised Button")
              ) ,
              body: Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children: const <Widget> [
                  ElevatedButton(
                   child: Text('First' , style: TextStyle(color: Colors.green   )
                   ) ,
                   onPressed:null ,
                  ),

                    Divider(height: 20,color: Colors.white) ,

                   ElevatedButton(onPressed: null,
                   child: Text('Second' , style: TextStyle(color: Colors.blue  )
                   ) ,

                  ),


 Divider(height: 20,color: Colors.white) ,

                                 
     
                

                ]

              )
        );

  }
}

