import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_jj/theme.dart';

class CardProductlist extends StatefulWidget {
  dynamic data;

  CardProductlist(this.data);

  @override
  State<CardProductlist> createState() => _CardProductlistState();
}

class _CardProductlistState extends State<CardProductlist> {
  @override
  Widget build(BuildContext context) {
    return widget.data == null
        ? CircularProgressIndicator()
        : Column(
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.data?.data.length,
                  itemBuilder: (context, snap) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 24, bottom: 10, top: 10, right: 24),
                          decoration: BoxDecoration(
                            color: secondary100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    '${widget.data?.data[snap].img}',
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
                                              widget.data?.data[snap].price))),
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
                              Column(
                                children: [
                                  Icon(Icons.favorite_outline),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: secondary200,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Icon(
                                      Icons.add,
                                      color: secondary100,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
  }
}
