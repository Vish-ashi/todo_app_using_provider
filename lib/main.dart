import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/TodoModel.dart';
import 'package:provider/src/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ashi Todo Flutter Application',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ChangeNotifierProvider(

          create: (BuildContext context) => TodoModel(),
          child: MyHomePage(),
        ),
        debugShowCheckedModeBanner: false,
    );
  }
}



class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
        Text(
          "Todo Application",
          style: TextStyle(color: Colors.black),),
        leading: IconButton(icon: Icon(Icons.menu,
          color: Colors.black87), onPressed: () {  },),
      ),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),

              Text("02 : 36 PM",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),),

              Text("current time",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,),),

              SizedBox(height: 20,),
            ],
          ), //to show the clock

          Expanded(
            child: DraggableScrollableSheet(
              maxChildSize: 0.85,
              builder: (BuildContext context, ScrollController scrollController){

            return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(60)),
                    color: Colors.white),
                child: Consumer<TodoModel>(
                  builder: (context, todo, child){
                    return ListView.builder(
                        itemCount: todo.taskList.length,
                        itemBuilder: (context, index){
                          return Container(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                  left: 32,
                                  right: 32,
                                  top: 8,
                                  bottom: 8),
                              title: Text(
                                todo.taskList[index].title,
                                style : TextStyle(
                                    color: Colors.black87,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              subtitle: Text(todo.taskList[index].detail, style: TextStyle(color: Colors.black45,
                                  fontWeight: FontWeight.bold),),
                              trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                              isThreeLine: true,
                            ),
                            margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),

                          );
                        },
                      controller: scrollController,
                    );
                  }
                )
            );
              }
            )
          )
        ]
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<TodoModel>(context).addTaskInList();
        },
      ),

    );
  }
}
