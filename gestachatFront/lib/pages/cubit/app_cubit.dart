

import 'package:bloc/bloc.dart';
import 'package:gestachat/pages/cubit/app_cubit_logics.dart';
import 'package:gestachat/pages/cubit/app_cubit_state.dart';
import 'package:gestachat/pages/cubit/app_cubit.dart';
import 'package:gestachat/pages/services/data_services.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit({required this.data}) : super( InitialState()){

    emit(WelcomeState() ) ;
  }  

  final DataServices data ;
  late final places ;

  void getData () async {
    try{
      emit(LoadingState()) ;
      places = await data.getActif() ;

      emit(LoadedState(places)) ;

    }
     catch(e){
      
     }
  }
}