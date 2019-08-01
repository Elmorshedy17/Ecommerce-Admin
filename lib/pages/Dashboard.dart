import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Revunue',
                style: TextStyle(fontSize: 21.0, color: Colors.grey),
              ),
              Text(
                "\$${12000}",
                style: TextStyle(fontSize: 21.0, color: Colors.lightGreen),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
//          color: Colors.red,
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(18.8),
                child: Card(
                  child: ListTile(
                    title: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.account_balance),
                      label: Text('Users'),
                    ),
                    subtitle: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
