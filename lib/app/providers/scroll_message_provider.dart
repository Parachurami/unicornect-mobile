import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScrollMessageNotifier extends StateNotifier<bool>{
  ScrollMessageNotifier():super(false);
  void updateMessenger(bool scrollState){
    state = scrollState;
  }
}


final scrollMessageProvider = StateNotifierProvider<ScrollMessageNotifier, bool>(
  (ref) {
    return ScrollMessageNotifier();
  },
);