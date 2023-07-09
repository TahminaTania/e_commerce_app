import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';

class ProductActionsWidget extends StatelessWidget {
  final Product product;
  const ProductActionsWidget({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 162, 194, 198),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  product.title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.5,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 15,
                          )),
                    ),
                    Container(
                        child: Text(
                      product.productCount.toString(),
                      style: TextStyle(fontSize: 15),
                    )),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            size: 15,
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
