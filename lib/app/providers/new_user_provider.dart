import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class NewUserProviderNotifier extends StateNotifier<dynamic>{
  NewUserProviderNotifier():super(true);
  final _mybox = Hive.box('misc_data');
  void addNewUser(){
    _mybox.put('user-data', false);
    state = _mybox.get('user-data');
  }

  void loadData(){
    if(_mybox.get('user-data') != null){
      state = _mybox.get('user-data');
      return;
    }
    state = true;
  }
  // bool isNewUser(){
  //   if(_mybox.get('user-data') != null){
  //     state = _mybox.get('user-data');
  //     return state;
  //   }
  //   return true;
  // }
}

final newUserProvider = StateNotifierProvider<NewUserProviderNotifier, dynamic>(
    (ref){
      return NewUserProviderNotifier();
    }
);
