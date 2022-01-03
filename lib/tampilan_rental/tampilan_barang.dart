import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rental/barang.dart';

class TampilanBarang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Rental Barang"),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
          Text('Available Barang',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: BarangTs(),
          ),
        ],
      ),
    );
  }
}