import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Osama extends StatefulWidget {
  @override
  _OsamaState createState() => _OsamaState();
}

class _OsamaState extends State<Osama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Osama'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 0.2), BlendMode.modulate),
                  image: AssetImage("assets/work.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      width: 360.0,
                      child: Text(
                        'لوريم ايبسوم هو نموذج افتراضي ',
                        style: TextStyle(
                            fontSize: 45.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'لوريم ايبسوم هو نموذج',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'لوريم ايبسوم هو نموذج',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'لوريم ايبسوم هو نموذج',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.blue,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
//              height: 400.0,
                      child: Row(
                        children: <Widget>[
                          FirstOne(),
                          SizedBox(
                            width: 20.0,
                          ),
                          SecondOne(),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: FlatButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.all(18.0),
                          // Add box decoration
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            // Box decoration takes a gradient
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.1, 0.5, 0.7, 0.9],
                              colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Colors.blue[800],
                                Colors.blue[700],
                                Colors.blue[600],
                                Colors.blue[400],
                              ],
                            ),
                          ),

                          child: Center(
                            child: Text(
                              'استمرار',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.2),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'عنوان النص',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                    ),
                  ),
                  Text(
                    "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...",
                    style: TextStyle(
                        height: 1.5, fontSize: 15.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...",
                    style: TextStyle(
                        height: 1.5, fontSize: 15.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...",
                    style: TextStyle(
                        height: 1.5, fontSize: 15.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...",
                    style: TextStyle(
                        height: 1.5, fontSize: 15.0, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Widget SecondOne() {
    return Expanded(
      child: InkWell(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ' شهور 6 ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'بتخفيض 60% من القيمة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    child: Text(
                      '6 شهور',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'بتخفيض 64% من القيمة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: seta),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            alhmd(),
          ],
        ),
        onTap: () {
          if (First) {
            setState(() {
              seta = Colors.blue;
              First = false;
              seto = Colors.white;
            });
          } else {
            setState(() {
              seta = Colors.white;
              First = true;
            });
          }
        },
      ),
    );
  }

  Widget FirstOne() {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (Niko) {
            setState(() {
              seto = Colors.blue;
              Niko = false;
              seta = Colors.white;
            });
          } else {
            setState(() {
              seto = Colors.white;
              Niko = true;
            });
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '6 اشهر',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'بتخفيض 60% من القيمة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    child: Text(
                      '6 اشهر',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
//                                    color: Colors.yellow,
                  ),
                  Text(
                    'بتخفيض 60% من القيمة',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: seto),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            YaKareem(),
          ],
        ),
      ),
    );
  }

  Widget YaKareem() {
    if (Niko != true) {
      return Positioned(
        top: 0.0,
        right: 20.0,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.pink,
            ),
            height: 25.0,
            width: 100.0,
            child: Center(
              child: Text(
                'save 60%',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
      );
    } else {
      return Container();
    }
  }

  Widget alhmd() {
    if (First != true) {
      return Positioned(
        top: 0.0,
        right: 20.0,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.pink,
            ),
            height: 25.0,
            width: 100.0,
            child: Center(
              child: Text(
                'save 60%',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )),
      );
    } else {
      return Container();
    }
  }

  bool First = true;
  bool Niko = true;
  Color seta = Colors.white;
  Color seto = Colors.white;
}
