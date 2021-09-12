import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }
}

class ProductAddState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Ürün Ekle"),
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              buildNameField(),
              buildDescriptionField(),
            ],
          ),
        ));
  }

  buildDescriptionField() {}

  buildNameField() {}

  buildUnitPriceField() {}
}
