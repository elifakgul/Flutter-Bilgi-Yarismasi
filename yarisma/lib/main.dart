import 'package:flutter/material.dart';
import 'package:yarisma/test_veri.dart';


import 'constants.dart';



void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {


  List <Widget> secimler=[];



  TestVeri test1=TestVeri();

  void butonFonksiyonu(bool secilenbuton){
    if(test1.testBittiMi()==true) {
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          setState(() {
            test1.testisifirla();
            secimler=[];
          });
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("TEBRİKLER!",
          textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,
        ),),
        content: Text("TESTİ BİTİRDİNİZ!"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );


    }



    else {setState(() {
      test1.getSoruYaniti()==secilenbuton?secimler.add(kDogruIconu):secimler.add(kYanlisIconu);
      test1.sonrakiSoru();

    });}

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
            'BİLGİ YARISMASI\n'
                'HOSGELDİNİZ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color:Colors.white,
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child:
                Text(
                test1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
            spacing: 3,
            runSpacing: 3,
            children: secimler
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[400],
                              onPrimary: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(Icons.thumb_down, size: 30.0),
                          ),
                          onPressed: () {
                            butonFonksiyonu(false);

                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green[400],
                              onPrimary: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(Icons.thumb_up, size: 30.0),
                          ),
                          onPressed: () {
                            butonFonksiyonu(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}






