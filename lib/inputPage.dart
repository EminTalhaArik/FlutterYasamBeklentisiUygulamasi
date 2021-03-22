import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/Widgets/constants.dart';
import 'package:yasam_beklentisi/Widgets/iconWidget.dart';
import 'package:yasam_beklentisi/resultPage.dart';
import 'package:yasam_beklentisi/userData.dart';
import 'Widgets/myContainerWidget.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet;
  double icilenSigara = 3;
  double haftalikSpor = 1;
  int kullaniciBoy = 170;
  int kullaniciKilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Yaşam Beklentisi",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton(
                      "Boy",
                      kullaniciBoy.toString(),
                      kullaniciBoy,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton(
                      "Kilo",
                      kullaniciKilo.toString(),
                      kullaniciKilo,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Haftada kaç gün spor yapıyorsun ?",
                    style: kMetinStili,
                  ),
                  Text(
                    "${haftalikSpor.round()}",
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: haftalikSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        haftalikSpor = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Günde kaç sigara içiyorsun ?",
                    style: kMetinStili,
                  ),
                  Text(
                    "${icilenSigara.round()}",
                    style: kSayiStili,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "Kadın";
                      });
                    },
                    renk: seciliCinsiyet == "Kadın"
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: IconCinsiyet(
                      icon: FontAwesomeIcons.venus,
                      metin: "Kadın",
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "Erkek";
                      });
                    },
                    renk: seciliCinsiyet == "Erkek"
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: IconCinsiyet(
                      icon: FontAwesomeIcons.mars,
                      metin: "Erkek",
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 45,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                            haftalikSpor: haftalikSpor,
                            icilenSigara: icilenSigara,
                            kullaniciBoy: kullaniciBoy,
                            kullaniciKilo: kullaniciBoy,
                            seciliCinsiyet: seciliCinsiyet))));
              },
              child: Text(
                "Hesapla",
                style: kMetinStili,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlineButton(
    String name,
    String value,
    int functionValue,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            name,
            style: kMetinStili,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            value,
            style: kSayiStili,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    if (functionValue == kullaniciKilo) {
                      kullaniciKilo++;
                    } else {
                      kullaniciBoy++;
                    }
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 13,
                ),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                onPressed: () {
                  setState(() {
                    if (functionValue == kullaniciKilo) {
                      kullaniciKilo--;
                    } else {
                      kullaniciBoy--;
                    }
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
