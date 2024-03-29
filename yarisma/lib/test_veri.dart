import 'soru.dart';

class TestVeri {

  int _soruIndex=0;

  List <Soru> _soruBankasi = [
    Soru(soruMetni: '1.Titanic gelmiş geçmiş en büyük gemidir',
        soruYaniti: false),
    Soru(soruMetni: '2.Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: '3.Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: '4.Dünya düzdür', soruYaniti: false),
    Soru(soruMetni: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(soruMetni: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: '7.Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
  ];


  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;

  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;

  }

  void sonrakiSoru(){
    if(_soruIndex+1<_soruBankasi.length);
    _soruIndex++;
  }

  bool testBittiMi(){
    if(_soruIndex+1>=_soruBankasi.length){
      return true;
    }else{
      return false;
    }

  }

  void testisifirla(){
    _soruIndex=0;
  }
}