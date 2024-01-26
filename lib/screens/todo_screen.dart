import 'dart:convert';

import 'package:dummy_api_hit/models/todos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  

  @override
  State<TodoPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TodoPage> {
  TodosListModel? todosListModel;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodos();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        title: Text('Todos...'),
        backgroundColor: Colors.teal,
      ),
      body: todosListModel!=null &&todosListModel!.todos.isNotEmpty?
      ListView.builder(
        itemCount: todosListModel!.todos.length,
        itemBuilder: (_,index){
          var myTodo=todosListModel!.todos[index];
          var isCompleted=false;
          
          return Padding(
            padding: const EdgeInsets.all(11.0),
            child: Card(
              elevation: 7,
              child: ListTile(
                leading: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.5),color: Colors.amber),
                  child: Center(child: Text("${myTodo.id}"))),
                title: Row(
                  children: [
                    Expanded(child: Text(myTodo.todo)),
                    Text(isCompleted==myTodo.completed?"":"Completed",style: TextStyle(
                  //decoration: TextDecoration.lineThrough,
                  color: Colors.green,),),
                  ],
                ),

              ),
            ),
          );

      }):Center(
        child: Text('NO Todos..'),
      )
 
    );
  }

//calling http request..
void getTodos()async{
  var uri=Uri.parse("https://dummyjson.com/todos");
  var response=await http.get(uri);
  if(response.statusCode==200){
    var mTodo=jsonDecode(response.body);
    
    todosListModel=TodosListModel.fromJson(mTodo);

    setState(() {
      
    });
    print(todosListModel);
  }
}
  
}
