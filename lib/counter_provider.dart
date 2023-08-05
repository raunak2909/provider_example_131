import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

  //state
  int _count = 0;

  //change
  void incrementCount(){
    _count++;
    notifyListeners();
  }

  void decrementCount(){
    if(_count>0) {
      _count--;
      notifyListeners();
    }
  }

  int getCountValue(){
    return _count;
  }


}