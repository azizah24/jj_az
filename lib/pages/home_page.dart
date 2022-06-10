import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_jj/koneksi/koneksi_json.dart';
import 'package:test_jj/model/model_image.dart';
import 'package:test_jj/model/model_produk.dart';
import 'package:test_jj/theme.dart';
import 'package:test_jj/widget/card_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  bool scrollfit = false;
  ModelImage? modelImage;
  ModelProduk? modelProduk;
  int touchedIndex = -1;
  int posisinav = 0;
  TabController? _tabController;
  int _current = 0;
  bool loading = false;

  getData() async {
    setState(() {
      loading = true;
    });
    modelImage = await KoneksiJson().getImage();
    modelProduk = await KoneksiJson().getProduk();
    setState(() {
      loading = false;
    });
  }

  void handleTabSelection() {
    if (_tabController!.indexIsChanging ||
        _tabController?.index != _tabController?.previousIndex) {
      posisinav = _tabController!.index;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _tabController = TabController(length: 5, vsync: this);
    _tabController?.addListener(handleTabSelection);
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollContent);
  }

  void dispose() {
    super.dispose();
    _scrollController?.dispose();
    _tabController?.dispose();
  }

  _scrollContent() {
    if (scrollfit) {
      _scrollController?.jumpTo(0);
    }
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
                backgroundColor: secondary100,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.local_drink,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.history_outlined,
                        size: 30,
                      ),
                      label: ''),
                ]),
          ),
        ),
        appBar: AppBar(
          backgroundColor: primary100,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
                left: 24, right: 24, top: Platform.isIOS ? 60 : 40, bottom: 10),
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
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, v) {
            return [
              SliverToBoxAdapter(
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            color: primary100,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    'https://ararasa.com/wp-content/uploads/2020/03/logo-jj-Registered.png',
                                    height: 60,
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, top: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CarouselSlider(
                                      options: CarouselOptions(
                                          height: 160,
                                          enableInfiniteScroll: false,
                                          autoPlay: true,
                                          viewportFraction: 1.0,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _current = index;
                                            });
                                          }),
                                      items: List.generate(
                                          modelImage?.data.length ?? 0,
                                          (index) {
                                        return Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.15),
                                                    blurRadius: 8,
                                                    spreadRadius: 0,
                                                    offset: Offset(0, 1))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(modelImage
                                                          ?.data[index].img ??
                                                      ''),
                                                  fit: BoxFit.fill),
                                            ));
                                      })),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              modelImage?.data.length ?? 0,
                                              (index) {
                                            return Container(
                                              width: 8.0,
                                              height: 8.0,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 1.0,
                                                  horizontal: 4.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: _current == index
                                                      ? secondary200
                                                      : primary100),
                                            );
                                          })),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TabBar(
                                    padding: EdgeInsets.zero,
                                    labelStyle: typeMed,
                                    labelColor: Colors.black,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    isScrollable: true,
                                    indicatorColor: secondary200,
                                    indicatorPadding:
                                        EdgeInsets.only(right: 18, left: 18),
                                    unselectedLabelColor: secondary200,
                                    unselectedLabelStyle: typeReg.copyWith(
                                        color: secondary200,
                                        fontWeight: FontWeight.w300),
                                    controller: _tabController,
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          'Populer',
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Untukmu',
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Kopi',
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Teh',
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          'Snack',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            top: 85,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    decoration: BoxDecoration(
                                        color: secondary200,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Center(
                                        child: Text(
                                      'Pesan Sekarang!',
                                      style: typeBold.copyWith(
                                          color: secondary100, fontSize: 16),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
              )
            ];
          },
          body: Container(
            color: secondary100,
            child: TabBarView(controller: _tabController, children: [
              Container(
                  child: ListView(
                children: [
                  CardProduct(modelProduk),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terakhir Dibeli',
                          style: typeMed.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Lihat Semua',
                          style: typeMed.copyWith(color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  CardProduct(modelProduk),
                ],
              )),
              Container(
                  child: ListView(
                children: [
                  CardProduct(modelProduk),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terakhir Dibeli',
                          style: typeMed.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Lihat Semua',
                          style: typeMed.copyWith(color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  CardProduct(modelProduk),
                ],
              )),
              Container(
                  child: ListView(
                children: [
                  CardProduct(modelProduk),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terakhir Dibeli',
                          style: typeMed.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Lihat Semua',
                          style: typeMed.copyWith(color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  CardProduct(modelProduk),
                ],
              )),
              Container(
                  child: ListView(
                children: [
                  CardProduct(modelProduk),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terakhir Dibeli',
                          style: typeMed.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Lihat Semua',
                          style: typeMed.copyWith(color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  CardProduct(modelProduk),
                ],
              )),
              Container(
                  child: ListView(
                children: [
                  CardProduct(modelProduk),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Terakhir Dibeli',
                          style: typeMed.copyWith(fontSize: 16),
                        ),
                        Text(
                          'Lihat Semua',
                          style: typeMed.copyWith(color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  CardProduct(modelProduk),
                ],
              )),
            ]),
          ),
        ));
  }
}
