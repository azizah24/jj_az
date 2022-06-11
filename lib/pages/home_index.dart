import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_jj/koneksi/koneksi_json.dart';
import 'package:test_jj/model/model_image.dart';
import 'package:test_jj/pages/home_page.dart';
import 'package:test_jj/pages/produk_page.dart';
import 'package:test_jj/pages/started_page.dart';
import 'package:test_jj/theme.dart';

import '../model/model_produk.dart';

class IndexHomePage extends StatefulWidget {
  const IndexHomePage({Key? key}) : super(key: key);

  @override
  State<IndexHomePage> createState() => _IndexHomePageState();
}

class _IndexHomePageState extends State<IndexHomePage> {
  int posisinav = 0;
  List nav = [];
  ModelImage? modelImage;
  ModelProduk? modelProduk;
  bool loading = false;

  getData() async {
    setState(() {
      loading = true;
    });
    modelImage = await KoneksiJson().getImage();
    modelProduk = await KoneksiJson().getProduk();
    setState(() {
      loading = false;
      nav = [HomePage(), ProdukPage(modelProduk), ProdukPage(modelProduk)];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 4),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            selectedItemColor: secondary200,
            selectedFontSize: 0,
            unselectedItemColor: Colors.grey,
            backgroundColor: secondary100,
            elevation: 0,
            currentIndex: posisinav as int,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_drink,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history_outlined,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                  label: ''),
            ],
            onTap: (index) {
              setState(() {
                posisinav = index;
                print(posisinav);
                print(index);
              });
            },
          ),
        ),
      ),
      appBar: nav[posisinav as int] == nav[1]
          ? AppBar(
              backgroundColor: primary100,
              automaticallyImplyLeading: false,
              elevation: 0,
            )
          : AppBar(
              backgroundColor: primary100,
              automaticallyImplyLeading: false,
              centerTitle: false,
              elevation: 0,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: Platform.isIOS ? 60 : 40,
                    bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff998689)),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Hai,',
                              style: typeReg.copyWith(color: secondary200)),
                          TextSpan(
                              text: ' Azizah!',
                              style: typeBold.copyWith(color: secondary200))
                        ]))
                      ],
                    ),
                    Icon(Icons.notifications_outlined)
                  ],
                ),
              ),
            ),
      body: SafeArea(
        child: Stack(children: [nav[posisinav as int]]),
      ),
    );
  }
}
