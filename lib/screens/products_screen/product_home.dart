import 'dart:convert';
import 'package:dummy_api_hit/models/products_model.dart';
import 'package:dummy_api_hit/screens/products_screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductHomePage> {
  ProductListModel? productData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade200,
        appBar: AppBar(
          title: Text('Product Home'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: productData != null && productData!.products.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.all(21),
                itemCount: productData!.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 21,
                    mainAxisSpacing: 21,
                    mainAxisExtent: 250,
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  var pData = productData!.products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                    productData: pData,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            pData.thumbnail,
                            width: 150,
                            height: 150,
                          ),
                          Container(
                            height: 90,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(11))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pData.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${pData.discountPercentage}% off",
                                        style: TextStyle(color: Colors.yellow),
                                      ),
                                      const SizedBox(width: 5),
                                      Text("\$ ${pData.price}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Center(
                child: Text('No products...'),
              ));
  }

  //function to get product data..
  void getProductData() async {
    var uri = Uri.parse("https://dummyjson.com/products");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      productData = ProductListModel.fromJson(data);
      setState(() {});
    }
  }
}
