import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final String date;
  final String isComplete;
  final VoidCallback onPress;

  const CustomCard(
      {Key key,
      this.title,
      this.subtitle,
      this.date,
      this.index,
      this.isComplete,
      this.onPress})
      : assert(date != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ExpansionTile(
        leading: Icon(Icons.library_books),
        title: Text(this.title),
        children: [
          ListTile(
            leading: Text('Description : '),
            title: Text(this.subtitle),
          ),
          Divider(),
          ListTile(
            leading: Text('Deadline : '),
            title: Text(this.date),
          ),
          Divider(),
          ListTile(
            leading: Text('Completed : '),
            title: Text(this.isComplete),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Task is completed'),
              SizedBox(
                width: 20,
              ),
              FlatButton(
                color: Colors.redAccent,
                onPressed: onPress,
                child: Text(
                  'Delete',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
