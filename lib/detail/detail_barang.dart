import 'package:flutter/material.dart';
import 'package:rental/specification/spec_barang.dart';

void _showSimpleDialog(context) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Permintaan Terkirim",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}

class DetailBarang extends StatelessWidget {
  final String title;
  final double price;
  final String brand;
  final String path;

  DetailBarang(
      {required this.title,
        required this.price,
        required this.brand,
        required this.path
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Rental Barang"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,
          ),
          ),
          Text(
            brand,
            style: TextStyle(fontSize: 15,
            ),
          ),
          Hero(tag: title, child: Image.asset(path, width: 200, height: 200,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpesifikBarang(
                name: '12 Month',
                price: price * 12,
                name2: 'Dollars',
              ),
              SpesifikBarang(
                name: '6 Month',
                price: price * 6,
                name2: 'Dollars',
              ),
              SpesifikBarang(
                name: '1 Month',
                price: price * 1,
                name2: 'Dollars',
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'SPECIFICATIONS',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpesifikBarang(
                name: 'Brand',
                name2: brand,
                price: price,
              ),
            ],
          ),
          SizedBox(height:10),
          RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: (){
              _showSimpleDialog(context);
            },
            padding: EdgeInsets.all(10.0),
            color: Colors.blueAccent,
            child: Text(
              'Rental',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}