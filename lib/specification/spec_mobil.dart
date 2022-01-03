import 'package:flutter/material.dart';

class SpesifikMobil extends StatelessWidget {
  final double price;
  final String name;
  final String name2;

  SpesifikMobil({
    required this.price,
    required this.name,
    required this.name2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: price == null ? 50 : 90,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5)),
        child: price == null
            ? Column(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
              ),
            ),
          ],
        )
            : Column(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              price.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(name2)
          ],
        ),
    );
  }
}
