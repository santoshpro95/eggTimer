import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'egg_timer_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  EggTimerBloc eggTimerBloc = EggTimerBloc();

  //#region Region - Dispose
  @override
  void dispose() {
    eggTimerBloc.dispose();
    super.dispose();
  }

  //#endregion

  //#region Region - Build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffD2F0ED),
        body: body(),
      ),
    );
  }

  //#endregion

  //#region Region - Body
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 100),
          child: StreamBuilder<String>(
              stream: eggTimerBloc.eggStatusCtrl.stream,
              initialData: "Start Egg Timer",
              builder: (context, snapshot) {
                return Text(
                  snapshot.data,
                  style: TextStyle(fontSize: 20),
                );
              }),
          alignment: Alignment.center,
        ),
        Container(
          child: Row(
            children: [softBoil(), mediumBoil(), hardBoil()],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: LinearProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
            backgroundColor: Colors.black45,
            value: 0.5,
          ),
        ),
      ],
    );
  }

//#endregion

  //#region Region - HardBoil Egg
  Widget hardBoil() {
    return Expanded(
      child: CupertinoButton(
        onPressed: () => eggTimerBloc.onSelectEgg("Hard"),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/hard_egg.png'),
            Text(
              "Hard",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  //#endregion

  //#region Region - MediumBoil Egg
  Widget mediumBoil() {
    return Expanded(
      child: CupertinoButton(
        onPressed: () => eggTimerBloc.onSelectEgg("Medium"),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/medium_egg.png'),
            Text(
              "Medium",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  //#endregion

  //#region Region - SoftBoil Egg
  Widget softBoil() {
    return Expanded(
      child: CupertinoButton(
        onPressed: () => eggTimerBloc.onSelectEgg("Soft"),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/soft_egg.png'),
            Text(
              "Soft",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

//#endregion

}
