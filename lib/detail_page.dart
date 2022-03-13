import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final int price;

  const DetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.price
    //this.price = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Image.network(image),
              SizedBox(height: 40,),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              Text("${price}"),
            ],
          ),
        ),
      ),
    );
  }
}
