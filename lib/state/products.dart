
import 'package:get/get.dart';
import 'dart:math';
import '../models/item.dart';

class Products extends GetxController {
  // All products
  final RxList<Item> _items = List.generate(20,
          (index) => Item(
          id: index,
          name: 'Shirt $index',
          price: Random().nextDouble() * 100,
          itemQty: 0.obs)).obs;

  // Use this to retrieve all products
  List<Item> get items {
    return [..._items];
  }

  // This will return the products that were added to cart list
  List<Item> get cartListItems {
    return _items.where((item) => item.itemQty.value > 0).toList();
  }

  // Add an item to the cart list
  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    var qty = _items[index].itemQty + 1;
    _items[index].itemQty.value = int.parse(qty.toString());
  }

  // Remove an item from the cart list
  void removeItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);

    var qty = _items[index].itemQty > 1 ? _items[index].itemQty - 1 : 0;
    _items[index].itemQty.value = int.parse(qty.toString());

  }
}