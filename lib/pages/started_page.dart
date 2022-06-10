import 'package:flutter/material.dart';
import 'package:test_jj/pages/home_page.dart';
import 'package:test_jj/theme.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  _StartedPageState createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF1EC),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  'https://poininngcdn.azureedge.net/smartpromo/Merchant/Logo/EE1AFD42-D255-48C7-9037-6B44F12AECA3.png'),
              SizedBox(
                height: 26,
              ),
              Text('JJ-Azizah'),
              SizedBox(
                height: 26,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      color: Color(0xff393939),
                      borderRadius: BorderRadius.circular(99)),
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Center(
                    child: Text(
                      'Mulai',
                      style: typeBold.copyWith(color: secondary100),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
