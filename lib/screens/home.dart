import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey formKey = GlobalKey();

  TextEditingController _userName = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _email = TextEditingController();

  Future displayDialog() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add Details'),
        content: Form(
          key: formKey,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _userName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Jon Doe',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _age,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: '18',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'jon.doe@company.com',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
              _userName.text = '';
              _age.text = '';
              _email.text = '';
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: addDataToTable,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  addDataToTable() async {
    setState(() {
      dataRow.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text('${_userName.text}')),
            DataCell(Text('${_age.text}')),
            DataCell(
              Text(
                '${_email.text}',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      );
    });
    Navigator.pop(context);
    _userName.text = '';
    _age.text = '';
    _email.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailer'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          dataRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return Colors.transparent; // Use the default value.
          }),
          columns: const <DataColumn>[
            DataColumn2(
              label: Text(
                'Name',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            DataColumn2(
              label: Text(
                'Age',
                style: TextStyle(color: Colors.amber),
              ),
            ),
            DataColumn2(
              label: Text(
                'Email',
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
          rows: dataRow.toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Details',
        backgroundColor: Colors.amber[400],
        child: Icon(Icons.add),
        onPressed: () => displayDialog(),
      ),
    );
  }

  List<Widget> allChips = [];

  List<DataRow> dataRow = [];
}
