import 'dart:async';

class EggTimerBloc{

  //#region Region - Controllers
  final eggStatusCtrl = StreamController<String>();
  //#endregion



  //#region Region - On Select Egg
  void onSelectEgg(String eggType){
    eggStatusCtrl.sink.add(eggType);
    print(eggType);
  }
  //#endregion


  //#region Region - Dispose
  void dispose(){
    eggStatusCtrl.close();
  }
  //#endregion


}