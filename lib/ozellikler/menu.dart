import 'package:flutter/material.dart';
import 'package:simsek/renkler.dart';
import 'package:simsek/ekranlar/anasayfa/anasayfa.dart';
import 'package:simsek/ekranlar/giris/giris.dart';
import 'package:simsek/ekranlar/satisfatura/satisfatura.dart';
import 'package:simsek/ekranlar/urunler/urunliste.dart';
class appbar extends StatefulWidget{

  @override
  _appbarget createState() => _appbarget();
}

class _appbarget extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simsekler App"), centerTitle: true),
      body: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: kPrimaryColor),
              accountName: Text(
                "Halim Şimşek",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                "Süper Kullanıcı",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),

            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.home,
                    ),
                    title: Text("ANASAYFA"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Anasayfa();
                          },
                        ),
                      );

                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.fiber_new_sharp),
                      title: Text("Satış Faturası"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return satisfatura();
                          },
                        ),
                      );

                      }),
                  ListTile(
                      leading: Icon(Icons.fiber_new_sharp),
                      title: Text("Ürünler"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Urunler();
                            },
                          ),
                        );

                      }),
                  ListTile(
                      leading: Icon(Icons.article),
                      title: Text("Tahsilat"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {

                      }),
                  ListTile(
                      leading: Icon(Icons.people),
                      title: Text(
                        "Alış Faturası",
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {

                      }),
                  ListTile(
                      leading: Icon(Icons.video_collection_outlined),
                      title: Text("Veri Al"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {

                      }),
                  ListTile(
                      leading: Icon(Icons.video_collection_outlined),
                      title: Text("Merkeze Gönder"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {

                      }),
                  ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Çıkış Yap"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return GirisEkrani();
                            },
                          ),
                        );
                      }),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}