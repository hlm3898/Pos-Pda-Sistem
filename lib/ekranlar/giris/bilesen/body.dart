import 'package:flutter/material.dart';
import 'package:simsek/ekranlar/giris/bilesen/arkaplan.dart';
import 'package:simsek/ozellikler/rounded_button.dart';
import 'package:simsek/ozellikler/rounded_input_field.dart';
import 'package:simsek/ozellikler/rounded_password_field.dart';
import 'package:simsek/ekranlar/anasayfa/anasayfa.dart';
import 'package:flutter_svg/svg.dart';


class Body extends StatefulWidget {
  @override
  _oturumac createState() => _oturumac();

}
class _oturumac extends State<Body> {
  String kullanici;
  String sifre;
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
              "Giriş Yap",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Kullanıcı Adı",
              onChanged: (value) {
                setState(() {
                  kullanici = value;

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
              text: "Giriş",
              press: () {

                if(kullanici=="1"&& sifre=="1"){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Anasayfa();
                    },
                  ),
                );


                }else{

                  setState(() {
                    _mesaj = !_mesaj;
                  });

                }

              },
            ),
            if (_mesaj) Text("Kullanıcı Adı Veya Şifre Yanlış"),



            SizedBox(height: size.height * 0.03),



          ],
        ),
      ),
    );
  }


}
