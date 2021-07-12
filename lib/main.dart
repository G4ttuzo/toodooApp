import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>[''];
  TextEditingController nameController = TextEditingController();

  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      print("value_added: ${nameController.text}"
          "\n********************************");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo app'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your ToDo here !',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                addItemToList();
              },
              child: Text('Add')),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(2),
                  color: Colors.grey,
                  height: 50,
                  child: Center(
                    child: ListTile(
                      title: Text(
                        '${names[index]}',
                        style: TextStyle(fontSize: 18),
                      ),
                      onLongPress: () {
                        updateInterface();
                        print('value_removed ${names[index]} at_posistion: ${names.indexOf(names[index])}');// , $names');
                        names.remove(names[index]);
                        print('new_list: $names'
                            '\n_____________________________');
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void updateInterface() {
    setState(() {});
  }
}
