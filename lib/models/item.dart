import 'package:get/get.dart';

class Item {
  int id;
  String name;
  double price;
  RxInt itemQty;

  Item({this.id, this.name, this.price, this.itemQty});
}
