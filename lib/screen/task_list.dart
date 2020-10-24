import 'package:flutter/material.dart';
import 'package:my_new_demo/utils/advert.dart';

import '../model/todo_model.dart';
import '../service/database/db_helper.dart';
import 'add_todo.dart';
import 'custom_card.dart';
import 'settings.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var db = DatabaseHelper();
  final List<TodoModel> itemList = <TodoModel>[];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final AdvertService _advertService = AdvertService();

  @override
  void initState() {
    super.initState();
    _readToDoList();
    db.getItems();
    _advertService.showBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('My Todo List'),
          leading: Icon(Icons.done_all),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => Settings()));
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductView()));
          },
        ),
        body: _listView());
  }

  _deleteNoDo(int id, int index) async {
    debugPrint("Deleted Todo!");

    await db.deleteItem(id);
    setState(() {
      itemList.removeAt(index);
    });
  }

  _readToDoList() async {
    List items = await db.getItems();
    items.forEach((item) {
      TodoModel todoItem = TodoModel.fromMap(item);
      setState(() {
        itemList.add(TodoModel.map(item));
      });

      print("Db items: ${todoItem.id}");
    });
  }

  Widget _listView() => ListView.separated(
        itemCount: itemList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => CustomCard(
          title: itemList[index].title,
          subtitle: itemList[index].description,
          date: itemList[index].deadline,
          isComplete: itemList[index].isCompleted == 1 ? 'No ' : 'Yes',
          onPress: () async {
            _deleteNoDo(itemList[index].id, index);
            scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Task has been deleted'),
            ));
          },
        ),
      );
}
