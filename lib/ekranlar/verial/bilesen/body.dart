import 'package:flutter/material.dart';
import 'package:simsek/ekranlar/verial/bilesen/background.dart';
import 'package:simsek/ozellikler/rounded_button.dart';
import 'package:simsek/ozellikler/rounded_password_field.dart';
import 'package:simsek/ozellikler/rounded_input_field.dart';
import 'package:simsek/renkler.dart';
import 'package:simsek/ekranlar/giris/giris.dart';
class Body extends StatefulWidget {
  @override
  _verial createState() => _verial();

}

class _verial extends State<Body> {
  String ipadres;
  String veritabaniadi;
  String sifre;
  bool _veralindi = false;
  bool _mesaj = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Veri Al",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "İp Adresi",
              onChanged: (value) {
                setState(() {
                  ipadres = value;

                });

              },
            ),
            RoundedInputField(
              hintText: "Veritabanı Adı",
              onChanged: (value) {
                setState(() {
                  veritabaniadi = value;

                });

              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                setState(() {
                  sifre = value;
                });
              },
            ),
            renklibuton(
              text: "Veri Al",
              press: () {

                if(ipadres=="192.168.1.50"){
                  setState(() {
                    _veralindi = !_veralindi;
                  });


                }else{

                  setState(() {
                    _mesaj = !_mesaj;
                  });

                }

              },
            ),
            if (_mesaj) Text("Baglantı Kurulamadı"),
            if (_veralindi) Text("Veri Başarı İle Alındı"),

            if (_veralindi) renklibuton(
              text: "Giriş Yap",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GirisEkrani();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),



          ],
        ),
      ),
    );
  }


}
