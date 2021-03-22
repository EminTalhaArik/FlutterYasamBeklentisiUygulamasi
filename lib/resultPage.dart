import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/Widgets/constants.dart';
import 'package:yasam_beklentisi/hesapla.dart';
import 'package:yasam_beklentisi/userData.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;

  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sonuç Sayfası",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(40),
                    child: Text(
                      "Ortalama Yaşam Beklentisi",
                      style: kMetinStili,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(40),
                    child: Text(
                      Hesapla(_userData).hesapla().round().toString(),
                      style: kMetinStili,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {},
              child: Text(
                "Geri Dön",
                style: kMetinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
