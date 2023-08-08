import 'package:flutter/cupertino.dart';

class ListDataProvider extends ChangeNotifier{
  List<Map<String, dynamic>> _mData = []; // [1,2,4,7]

  List<Map<String, dynamic>> getMyListData(){
    return _mData;
  }

  //actions(EVENTS)
  addData(Map<String, dynamic> newData){
    _mData.add(newData);
    notifyListeners();
  }

  updateData(Map<String, dynamic> dataToBeUpdated, int index){
    _mData[index] = dataToBeUpdated;
    notifyListeners();
  }

  removeData(int index){
    _mData.removeAt(index);
    notifyListeners();
  }

/*removeDataMap(Map<String, dynamic> dataToBeDeleted){
    _mData.removeWhere((element) => element==dataToBeDeleted);
    notifyListeners();
  }*/
}