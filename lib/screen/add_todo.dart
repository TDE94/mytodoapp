import 'package:flutter/material.dart';
import 'package:my_new_demo/utils/advert.dart';

import '../model/todo_model.dart';
import '../service/database/db_helper.dart';
import '../utils/deadline.dart';
import '../utils/decoration.dart';
import 'settings.dart';
import 'task_list.dart';

class AddProductView extends StatefulWidget {
  @override
  _AddProductViewState createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  GlobalKey<FormState> formKey = GlobalKey();
  int _value = 1;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  TextEditingController controllerDeadline = TextEditingController();
  final AdvertService _advertService = AdvertService();
  var dbHelper = DatabaseHelper();
  String validator(val) {
    if (val.isEmpty) {
      return "This area is not accept empty value";
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _advertService.showIntersitial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new todo'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidate: true,
            key: formKey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                        keyboardType: TextInputType.name,
                        controller: controllerName,
                        decoration: decoration('Title', ''),
                        validator: this.validator),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      maxLines: 3,
                      controller: controllerDesc,
                      decoration: decoration('Description', ''),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "This area is not accept empty value";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Deadline(
                      controller: controllerDeadline,
                      deadline: controllerDeadline.text,
                      onSave: (value) {
                        controllerDeadline.text = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Is this Todo Important?'),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                        elevation: 8,
                        style: TextStyle(fontSize: 20, color: Colors.teal),
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text('Yes'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('No'),
                            value: 2,
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                    SizedBox(
                      height: 50,
                    ),
                    Divider(),
                    FloatingActionButton.extended(
                      backgroundColor: Colors.teal,
                      splashColor: Colors.blue,
                      shape: StadiumBorder(),
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          var model = TodoModel(
                              title: controllerName.text,
                              description: controllerDesc.text,
                              isCompleted: (_value).toString(),
                              deadline: controllerDeadline.text);
                          await dbHelper.saveItem(model);
                          Navigator.pushReplacement(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        }
                      },
                      label: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
