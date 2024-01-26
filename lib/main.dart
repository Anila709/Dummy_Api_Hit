import 'package:dummy_api_hit/screens/products_screen/product_home.dart';
import 'package:dummy_api_hit/screens/quotes_screen.dart';
import 'package:dummy_api_hit/screens/todo_screen.dart';
import 'package:dummy_api_hit/screens/users_screen.dart';
import 'package:dummy_api_hit/screens/wallpaper_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
      ),
      home: const WallpaperPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Dummy Api '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.teal.shade700),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> QuotesPage()));
            },
            child: Text('Quotes Api'),
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.teal.shade700),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoPage()));
            },
            child: Text('Todos Api'),
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.teal.shade700),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductHomePage()));
            },
            child: Text('Products Api'),
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.teal.shade700),),
            onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> UsersHome()));

            },
            child: Text('Users Api'),
          ),
        ]),
      ),
    );
  }
}
