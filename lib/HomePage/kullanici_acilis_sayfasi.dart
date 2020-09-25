import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:belediyeler/KalipWidgetlar/AcilisListeElemanWidget.dart';

class KullaniciAcilisSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            elevation: 0,
            title: TyperAnimatedTextKit(
              isRepeatingAnimation: false,
              text: ["Halkın Belediyeleri"],
              speed: Duration(milliseconds: 100),
              textStyle: TextStyle(color: Colors.black),
            )),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            AcilisListeElemanWidget(
              ikon: Icons.bookmark_border,
              baslik: "Ana Akış",
              altBaslik: "Sistemdeki tüm haberler.",
              sayfaAdi: '/homePage',
            ),
            AcilisListeElemanWidget(
              ikon: Icons.bookmark,
              baslik: "Sizin Seçtikleriniz",
              altBaslik: "Sizin takip etmeye karar vediğiniz haberler akışı.",
            ),
            AcilisListeElemanWidget(
              ikon: Icons.people_outline,
              baslik: "Belediyelerle Etkileşim",
              altBaslik: "Kullanıcıların belediyelere iletmek istedikleri",
            ),
            AcilisListeElemanWidget(
              ikon: Icons.add,
              baslik: "Baba Akış",
              altBaslik: "Sistemdeki bazı haberler",
            ),
            AcilisListeElemanWidget(
              ikon: Icons.add,
              baslik: "Baba Akış",
              altBaslik: "Sistemdeki bazı haberler",
            ),
            AcilisListeElemanWidget(
              ikon: Icons.add,
              baslik: "Baba Akış",
              altBaslik: "Sistemdeki bazı haberler",
            ),
            AcilisListeElemanWidget(
              ikon: Icons.add,
              baslik: "Baba Akış",
              altBaslik: "Sistemdeki bazı haberler",
            ),
          ],
        ));
  }
}
