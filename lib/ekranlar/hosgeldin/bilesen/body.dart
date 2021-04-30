import 'package:flutter/material.dart';
import 'package:simsek/ekranlar/giris/giris.dart';
import 'package:simsek/ekranlar/verial/bilesen/background.dart';
import 'package:simsek/ekranlar/verial/verial.dart';
import 'package:simsek/ozellikler/rounded_button.dart';
import 'package:simsek/renkler.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
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
              "Şimşekler PDA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            renklibuton(
              text: "Giriş Yap",
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
            renklibuton(
              text: "Veri Al",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return verial();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
