import 'dart:convert';

import 'package:dummy_api_hit/models/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});
  @override
  State<QuotesPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuotesPage> {
 QuatesModel? quotesData;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    getQuoteData();
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        //leading: Icon(Icons.tips_and_updates,color: Colors.black,),
        title: Text('Quotes of the day'),
        backgroundColor: Colors.teal,
      ), 
      body: quotesData !=null && quotesData!.quotes.isNotEmpty ?
      ListView.builder(
        itemCount:quotesData!.quotes.length ,
        itemBuilder: (_,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 7,
            child: ListTile(
              title: Text(quotesData!.quotes[index].quote,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
              subtitle: Align(
                alignment: Alignment.bottomRight,
                child: Text(quotesData!.quotes[index].author,style: TextStyle(fontSize: 12,color: Colors.deepPurple),)),),
          ),
        );

      }):const Center(child: Text('No Quotes..'))
    );
  }

  void getQuoteData()async{
    
    var uri=Uri.parse("https://dummyjson.com/quotes");
    var response=await http.get(uri);
    if(response.statusCode==200){
      var data=await jsonDecode(response.body);
      quotesData=QuatesModel.fromJson(data);
      setState(() {
        
      });
    }
    
  }
}
