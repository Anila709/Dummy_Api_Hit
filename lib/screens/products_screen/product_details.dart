

import 'package:flutter/material.dart';


class ProductDetailsPage extends StatelessWidget {
   ProductDetailsPage({super.key,required this.productData});

  var productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(title: Text('Details..'),
      backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productData.images.length,
              itemBuilder: (_,index){
               return Image.network(productData.images[index]);
            }),
          ),
          const SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productData.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                Text("\$ ${productData.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
              ],
            ),
                   const SizedBox(
              height: 11,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade700),
                child: Center(child: Text(productData.brand,style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
              const SizedBox(width: 11,), 
               Container(
                padding: EdgeInsets.all(5),
                height: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade700),
                child: Center(child: Text(productData.category,style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
              const SizedBox(width: 11,), 
              Container(
                padding: EdgeInsets.all(5),
                height: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade700),
                child: Center(child: Text("stocks ${productData.stock}",style: TextStyle(color: Colors.white,fontSize: 15),)),
              ),
            ],),
            const SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade700),
                child: Center(child: Text("${productData.discountPercentage} % Discount",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
              ),
              const SizedBox(width: 11,), 
               Container(
                padding: EdgeInsets.all(5),
                height: 31,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade700),
                child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star,color: Colors.yellow,size: 19,),
                    Text("${productData.rating}",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ],
                )),
              ),
             
            ],),
            const SizedBox(height: 11,), 
            Container(
              width: double.infinity,
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.teal.shade400),
                child: Text(productData.description,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              ),
              ],
            ),
          ),

          
        ],
      ),
      
    );
  }
}