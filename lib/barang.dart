import 'package:flutter/material.dart';
import 'package:rental/detail/detail_barang.dart';
import 'package:rental/model_spec/barang.dart';

class BarangTs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: allbarang.barang.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(1.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => DetailBarang(
                title: allbarang.barang[i].title,
                brand: allbarang.barang[i].brand,
                price: allbarang.barang[i].price,
                path: allbarang.barang[i].path,
              ),
            ),
            );
          },
          child: Container(
              padding: EdgeInsets.only(
                  top: i.isEven ? 0 : 20, bottom: i.isEven ? 20 : 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Column(
                children: [
                  Hero(
                      tag: allbarang.barang[i].title,
                      child: Image.asset(allbarang.barang[i].path, fit: BoxFit.cover, width: 100, height: 100,)),
                  Text(
                    allbarang.barang[i].title,
                    style: TextStyle(fontSize: 15,
                    ),
                  ),
                  Text((allbarang.barang[i].price).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('per month')
                ],
              )),
        ),
      ),
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2,
      ),
    );
  }
}