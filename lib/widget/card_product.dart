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
