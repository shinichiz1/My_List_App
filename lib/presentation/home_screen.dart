import 'package:flutter/material.dart';
import 'package:my_list_score/config/routes.dart';
import 'package:my_list_score/presentation/global_storage.dart';
import 'package:my_list_score/presentation/person.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("My List"),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) => Card(
            child: ListTile(
          title: Text(
            (index + 1).toString() + "  " + people[index].name,
            style: TextStyle(fontSize: 22.0),
          ),
          trailing: Text(
            people[index].score.toString(),
            textScaleFactor: 2.0,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () => {
            Navigator.of(context)
                .pushNamed(AppRoutes.showScore, arguments: people[index])
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          store.set("name", ''),
          Navigator.of(context)
              .pushNamed(AppRoutes.edit, arguments: Person('', 0))
        },
        tooltip: 'Add Person',
        child: Icon(Icons.add),
      ),
    );
  }
}
