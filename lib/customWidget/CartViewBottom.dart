import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartViewBottom extends StatelessWidget {
  CartViewBottom(this.counter);
  int counter;
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(10),
          color: Colors.red,
          alignment: Alignment.center,
          child: Text('Total Cart Item : ${counter}',
              style: TextStyle(fontSize: 16, color: Colors.white)
          )
    );
  }
}
