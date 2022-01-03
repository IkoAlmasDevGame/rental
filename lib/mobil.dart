import 'package:flutter/material.dart';
import 'package:rental/detail/detail_mobil.dart';
import 'package:rental/model_spec/mobil.dart';

class MobilTs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allcars.cars.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => DetailMobil(
                title: allcars.cars[i].title,
                brand: allcars.cars[i].brand,
                fuel: allcars.cars[i].fuel,
                price: allcars.cars[i].price,
                path: allcars.cars[i].path,
                gearbox: allcars.cars[i].gearbox,
              ),
            ),
            );
          },
          child: Container(
              margin: EdgeInsets.only(
                  top: i.isEven ? 0 : 10, bottom: i.isEven ? 10 : 0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Column(
                children: [
                  Hero(
                      tag: allcars.cars[i].title,
                      child: Image.asset(allcars.cars[i].path)),
                  Text(
                    allcars.cars[i].title,
                    style: TextStyle(fontSize: 15,
                    ),
                  ),
                  Text((allcars.cars[i].price).toString(),
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