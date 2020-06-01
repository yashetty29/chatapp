import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  StatusState createState() => StatusState();
}

class StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onPressed: null),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
            ),
            title: Text('My Status'),
            subtitle: Text('Tap to Add Status'),
          ),
          Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                'Recent Upadates',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 23,
                          child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534067783941-51c9c23ecefd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
              ),
            ),
            title: Text('Ajinkya'),
            subtitle: Text('Today, 6:09pm'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 23,
                          child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1531804055935-76f44d7c3621?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'),
              ),
            ),
            title: Text('Charan'),
            subtitle: Text('Today, 2:40pm'),
          ),
          Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Text(
                'Viewed Upadates',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1530510004231-720218d936da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'),
            ),
            title: Text('Abhiram'),
            subtitle: Text('Today, 10:10am'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1532588961875-2c62724e895d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'),
            ),
            title: Text('Arbaaz'),
            subtitle: Text('Today, 2:20am'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.designer.io/wp-content/uploads/2019/10/1.png'),
            ),
            title: Text('Manish'),
            subtitle: Text('Today, 2:20am'),
          )
        ],
      ),
    );
  }
}
