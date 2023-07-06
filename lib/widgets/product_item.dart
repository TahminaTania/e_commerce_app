import 'package:e_commerce_app/Cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/cubit/product_cubit.dart';
import 'package:e_commerce_app/details/deatil_product.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  late bool isfav;

  ProductItem({required this.product, required this.isfav});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(product: widget.product)));
        },
        child: Card(
          color: Color.fromARGB(255, 230, 226, 226),
          //height: 400,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 220,
                  width: 180,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  // color: Colors.black45,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 25,
                        child: Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                //borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(widget.product.image)))
                            // child: Image(image: NetworkImage(product.image)),
                            ),
                      ),
                      Positioned(
                        top: 5,
                        right: 2,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  // why i have to use widget.product? it was working just with product when i am using stateless ???
                                  widget.isfav
                                      ? context
                                          .read<CartCubit>()
                                          .removeFromFav(widget.product)
                                      : context
                                          .read<CartCubit>()
                                          .addToFav(widget.product);
                                  setState(() {
                                    print(
                                        "is state working as- ${widget.isfav}");
                                    widget.isfav = !widget.isfav;
                                    print(
                                        "is state working as- ${widget.isfav}");
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color:
                                      widget.isfav ? Colors.red : Colors.black,
                                  size: 18,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    widget.product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10,
                        //fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Price: \$${widget.product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
