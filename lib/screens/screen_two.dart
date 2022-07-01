import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../customWidget/CartViewBottom.dart';
import '../state/products.dart';

class ScreenTwo extends StatelessWidget {
  final Products _p = Get.find<Products>();

  ScreenTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),

          Expanded(
              child: ListView.builder(
                  itemCount: _p.items.length,
                  // List item widget
                  itemBuilder: (context, index) {

                    final product = _p.items[index];

                    return Obx(() => Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                          color: Colors.white,
                          borderRadius:BorderRadius.all(Radius.circular(10)),
                          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0,),]
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Name : " + product.name),

                              SizedBox(height: 5,),

                              Text("MRP : " +  "\$${product.price.toStringAsFixed(2)}"),
                            ],
                          ),

                          product.itemQty.value > 0
                              ?
                          Row(
                            children: [

                              IconButton(
                                onPressed: () {
                                  _p.removeItem(product.id);
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                ),
                              ),

                              Text(" "+ product.itemQty.value.toString() + " "),

                              IconButton(
                                onPressed: () {
                                  _p.addItem(product.id);
                                },
                                icon: Icon(
                                  Icons.add_circle,
                                ),
                              )

                            ],
                          )
                              :
                          InkWell(
                            onTap: () {
                              _p.addItem(product.id);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                                    color: Colors.white,
                                    borderRadius:BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0,),]
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text("Add")
                            ),
                          )

                        ],
                      ),
                    ));

                  }
              )
          ),

          const SizedBox(height: 5,),

          Obx(() => CartViewBottom(_p.cartListItems.length)),
        ],
      ),
    );
  }

}