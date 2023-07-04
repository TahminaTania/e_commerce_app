import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:e_commerce_app/screens/home/home_page_bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return SafeArea(
          child: Container(
              //color: Colors.amber,
              height: double.infinity,
              child: Stack(children: [
                Positioned(
                    // top: 10,
                    child: Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.contain)),
                )),
                Positioned(
                    top: 10,
                    left: 10,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Container(
                      //color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              // BlocProvider.of<ProductCubit>(context).home();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePageBottom()));
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "detail Product",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    top: 300,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 162, 194, 198),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      product.title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3.5,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                    )),
                Positioned(
                    top: 400,
                    left: 10,
                    right: 10,
                    child: Container(
                        height: 250,
                        width: 350,
                        child: Text(
                          " Description: \n ${product.description}",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ))),
                Positioned(
                    bottom: 50,
                    right: 10,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "${product.price.toString()}\$",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.shopping_bag),
                              Text(
                                "Add To Cart",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ])),
        );
      },
    ));
  }
}
