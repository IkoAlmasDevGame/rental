import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rental/tampilan_rental/tampilan_barang.dart';
import 'package:rental/tampilan_rental/tampilan_mobil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Home Page Rental",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var width = 150;
  var height = 100;

  int _current = 0;
  CarouselController _controller = CarouselController();

  List<String> TextUpdate = [
    'Selamat Datang',
    '',
    '',
    '',
    '',
    '',
  ];

  List<String> ImageRental = [
    // Penyewaan Mobil
    'lib/images/mobil/honda/acura_nsxr_2017.png',
    'lib/images/mobil/honda/honda_hrv_2022.png',
    'lib/images/mobil/honda/honda_jazz_2018.png',
    'lib/images/mobil/mazda/mazda_mx5.png',
    'lib/images/mobil/mazda/mazda_rx7.png',
    'lib/images/mobil/mazda/mazda_rx8.png',
    'lib/images/mobil/mitsubishi/mitsubishi_lancer_evo_x.png',
    'lib/images/mobil/mitsubishi/mitsubishi_mirage.png',
    'lib/images/mobil/mitsubishi/mitsubishi_pajero_sport.png',
    'lib/images/mobil/mitsubishi/mitsubishi_xpander.png',
    'lib/images/mobil/nissan/nissan_gtr32.png',
    'lib/images/mobil/nissan/nissan_gtr35.png',
    'lib/images/mobil/nissan/nissan_s14.png',
    'lib/images/mobil/nissan/nissan_s15.png',
    'lib/images/mobil/toyota/toyota_alphard.png',
    'lib/images/mobil/toyota/toyota_avanza.png',
    'lib/images/mobil/toyota/toyota_camry_2018.png',
    'lib/images/mobil/toyota/toyota_corolla_2011.png',
    'lib/images/mobil/toyota/toyota_etios.png',
    'lib/images/mobil/toyota/toyota_innova.png',
    'lib/images/mobil/toyota/toyota_mk5.png',
    'lib/images/mobil/toyota/toyota_vios.png',
    // Barang Item Penyewaan
    'lib/images/barang/cam_recorder.png',
    'lib/images/barang/camera_cannon.png',
    'lib/images/barang/drone.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Rental"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Color.alphaBlend(Colors.orangeAccent, Colors.black54),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Selamat Datang Di Rental Kami',
                    speed: Duration(milliseconds: 300),
                    textStyle: TextStyle(fontStyle: FontStyle.normal, fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50, left: 10),
              child:Text('News Rental Text',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,),
              ),
              Padding(padding: EdgeInsets.only(top: 5, left: 10),
              child:Container(
                width: 390,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.8, color: Colors.black, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Builder(
                  builder: (BuildContext context)=>CarouselSlider(
                    items: TextUpdate.map((i){
                      return Text('\n\n$i', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 2.0,
                      initialPage: 6,
                      onPageChanged: (index, reason){
                        setState(() {
                            _current = index;
                          });
                        }
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: TextUpdate.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              Padding(padding: EdgeInsets.only(top: 25, left:5),
                child: Container(
                  width: 400,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.8, color: Colors.black, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                  ),
                  child: Builder(
                    builder: (BuildContext context)=>CarouselSlider(
                      items: ImageRental.map((image){
                        return Image.asset(image, fit: BoxFit.contain,
                        width: 400, height: 150,
                        colorBlendMode: BlendMode.clear,);
                      }).toList(),
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        initialPage: 25,
                        autoPlay: false,
                        scrollPhysics: ScrollPhysics(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 1)),
                  Padding(padding: EdgeInsets.only(top: 5),
                    child: InkWell(
                      child: Container(
                        width: width.toDouble(),
                        height: height.toDouble(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1.5, style: BorderStyle.solid),
                        ),
                        child: Text('\n\nElectronic', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,),
                      ),
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>TampilanBarang()));
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5, left: 107),
                    child: InkWell(
                      child: Container(
                        width: width.toDouble(),
                        height: height.toDouble(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1.5, style: BorderStyle.solid),
                        ),
                        child: Text('\n\nMobil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,),
                      ),
                      onTap: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context)=>Tampilanmobil()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit App'),
              onTap: (){
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
