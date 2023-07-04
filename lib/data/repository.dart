import 'dart:convert';

import 'package:e_commerce_app/data/api_clients.dart';
import 'package:e_commerce_app/models/products.dart';
import 'package:http/http.dart';

// class ProductRepository {
//   String userUrl = 'https://fakestoreapi.com/products';

//   Future<List<Product>> getdata({String? query}) async {
//     Response response = await get(Uri.parse(userUrl));

//     if (response.statusCode == 200) {
//       List result = jsonDecode(response.body);
//       return result.map((e) => Product.fromJson(e)).toList();
//       if (query != null) {
//         result = result
//             .where((e) => e.name!.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       } else {
//         print("not get searches");
//       }
//     } else {
//       throw "Something went wrong code ${response.statusCode}";
//     }
//   }
// }

// class ProductRepository {
//   String userUrl = 'https://fakestoreapi.com/products';
//   Future<List<Product>> getdata({String? query}) async {
//     Response response = await get(Uri.parse(userUrl));

//     if (response.statusCode == 200) {
//       List result = jsonDecode(response.body);

//       if (query != null) {
//         result = result
//             .where(
//                 (e) => e['title'].toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }

//       return result.map((e) => Product.fromJson(e)).toList();
//     } else {
//       throw "Something went wrong with status code ${response.statusCode}";
//     }
//   }
// }

class ProductRepository {
  String userUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getdata({String? query}) async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);

      if (query != null) {
        result = result
            .where(
                (e) => e['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      return result.map((e) => Product.fromJson(e)).toList();
    } else {
      throw "Something went wrong with status code ${response.statusCode}";
    }
  }

  List<String> categories = [];

  Future<List<Product>> getcategory({String? category}) async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      List<Product> products = result.map((e) => Product.fromJson(e)).toList();

      // Extract unique categories
      categories = products.map((product) => product.category).toSet().toList();

      if (category != null && category.isNotEmpty) {
        // Filter products based on category
        products =
            products.where((product) => product.category == category).toList();
      }

      return products;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
