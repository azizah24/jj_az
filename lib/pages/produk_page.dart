import 'package:flutter/material.dart';
import 'package:test_jj/koneksi/koneksi_json.dart';
import 'package:test_jj/model/model_image.dart';
import 'package:test_jj/model/model_produk.dart';
import 'package:test_jj/theme.dart';
import 'package:test_jj/widget/card_product_list.dart';

class ProdukPage extends StatefulWidget {
  dynamic data;

  ProdukPage(this.data);

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage>
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
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Pilih Menu',
                                style: typeBold.copyWith(
                                    color: secondary200, fontSize: 20),
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
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 12,
                              ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 24, right: 20),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: secondary200,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Center(
                                        child: Text(
                                      'Delivery',
                                      style: typeBold.copyWith(
                                          color: secondary100, fontSize: 16),
                                    )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 24),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: secondary100,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.15),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(0, 1))
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Center(
                                        child: Text(
                                      'Pick Up',
                                      style: typeBold.copyWith(
                                          color: secondary200, fontSize: 16),
                                    )),
                                  ),
                                ],
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: Text(
                  'Your Favorite',
                  style: typeBold.copyWith(color: secondary200),
                ),
              ),
              CardProductlist(widget.data),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 24, right: 24, bottom: 16),
                child: Text(
                  'Iced Coffe',
                  style: typeBold.copyWith(color: secondary200),
                ),
              ),
              CardProductlist(widget.data),
            ],
          )),
    ));
  }
}
