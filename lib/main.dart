import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "List View",
      home: listViewName(),
    );
  }
}

class Data{
  List<String> listName = new List();
  Data(){
    listName.add("Jonathan Darwin");
    listName.add("Carlie Ashton");
    listName.add("Agatha O'Sullivan");
    listName.add("Jamil Schroeder");
    listName.add("Shreya Craft");
    listName.add("Aidan Hartman");
    listName.add("Dalton Massey");
    listName.add("Rochelle Emerson");
    listName.add("Willem Tapia");
    listName.add("Stevie Bullock");
    listName.add("Sianna Hendricks");
  }

  List<String> getName(){
    return listName;
  }
}

class listViewName extends StatelessWidget{  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: ListView.separated(        
        separatorBuilder: (context, i) => Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Divider(
            color: Colors.grey,
            height: 0.5,          
          ),
        ),
        itemCount: Data().getName().length,
        itemBuilder: (context, i){                                   
            return ListTile(
              title: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(                        
                          child: Text(Data().getName()[i]),
                        ),
                        GestureDetector(
                          onTap: () => deleteName(context, Data().getName()[i]),
                          child: Text("Delete"),
                        )
                      ],
                    ),                    
                  )
                ],
              ),                            
              onTap: () => onClickListTile(context, Data().getName()[i]),              
            );
        },
      ),
    );
  }

  void onClickListTile(BuildContext context, String name){
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(name),
          duration: Duration(seconds: 1),
        )
      );
  }

  void deleteName(BuildContext context, String name){
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Delete"),
        content: Text("Are you sure want to delete " + name + "?"),
      )
    );
  }
}