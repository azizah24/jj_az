import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_jj/theme.dart';

class CardProduct extends StatefulWidget {
  dynamic data;
  CardProduct(this.data);

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  bool checkedValue = false;
  int value = 0;

  void popUpAdd() {
    final node = FocusScope.of(context);
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.4,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (context, scrollController) => StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (() {
                      stateSetter(() {
                        Navigator.of(context).pop();
                      });
                    }),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.clear,
                        size: 14,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Row(
                                children: [
                                  Image.network(
                                    '${widget.data?.data[0].img}',
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.data?.data[0].name}',
                                        style: typeMed,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(int.parse(
                                              widget.data?.data[0].price))),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet',
                                        style: typeLight,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.5,
                                color: secondary200,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Additional Topping:',
                                    style: typeBold,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  MediaQuery.removePadding(
                                    context: context,
                                    removeBottom: true,
                                    removeTop: true,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, snap) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: CheckboxListTile(
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                title: Text("Cincau"),
                                                value: checkedValue,
                                                activeColor: secondary200,
                                                onChanged: (newValue) {
                                                  stateSetter(() {
                                                    checkedValue = newValue!;
                                                  });
                                                },
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading, //  <-- leading Checkbox
                                              ),
                                            ),
                                            Text('+3.000')
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Sugar Level',
                                    style: typeBold,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                        contentPadding: EdgeInsets.zero,
                                        value: index,
                                        groupValue: value,
                                        onChanged: (ind) => stateSetter(
                                            () => value = ind as int),
                                        title: Text("Normal"),
                                      );
                                    },
                                    itemCount: 3,
                                  ),
                                  Text(
                                    'Ice Level',
                                    style: typeBold,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                        contentPadding: EdgeInsets.zero,
                                        value: index,
                                        groupValue: value,
                                        onChanged: (ind) => stateSetter(
                                            () => value = ind as int),
                                        title: Text("Normal"),
                                      );
                                    },
                                    itemCount: 3,
                                  ),
                                  Text(
                                    'Special Instructions',
                                    style: typeBold,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: secondary100,
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: secondary200)),
                                    padding: EdgeInsets.only(
                                      left: 12,
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Add Instructions',
                                      style: typeLight.copyWith(
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: primary100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.only(
                              left: 24, right: 24, top: 12, bottom: 12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price',
                                      style: typeLight,
                                    ),
                                    Text(
                                      'Rp 32.000',
                                      style: typeBold,
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 24, right: 20),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: secondary200,
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.only(top: 16, bottom: 16),
                                  child: Center(
                                      child: Text(
                                    'Pesan Sekarang',
                                    style: typeBold.copyWith(
                                        color: secondary100, fontSize: 16),
                                  )),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.data == null
        ? CircularProgressIndicator()
        : Column(
            children: [
              Container(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.data?.data.length,
                  itemBuilder: (context, snap) {
                    return Stack(
                      children: [
                        Container(
                          height: 250,
                          margin:
                              EdgeInsets.only(left: 30, bottom: 30, top: 30),
                          decoration: BoxDecoration(
                              color: secondary100,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 1))
                              ]),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                '${widget.data?.data[snap].img}',
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.data?.data[snap].name}',
                                        style: typeMed,
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(NumberFormat.currency(
                                              locale: 'id',
                                              symbol: 'Rp ',
                                              decimalDigits: 0)
                                          .format(int.parse(
                                              widget.data?.data[snap].price)))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Icon(Icons.favorite_outline)
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned.fill(
                          bottom: 20,
                          right: 40,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                popUpAdd();
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: secondary200,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Icon(
                                  Icons.add,
                                  color: secondary100,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
  }
}
