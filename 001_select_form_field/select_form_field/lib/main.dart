import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _items = [
  {
    'value': 'boxValue',
    'label': 'Box Label',
    'icon': Icon(Icons.stop),
  },
  {
    'value': 'circleValue',
    'label': 'Circle Label',
    'icon': Icon(Icons.fiber_manual_record),
    'textStyle': TextStyle(color: Colors.red),
  },
  {
    'value': 'starValue',
    'label': 'Star Label',
    'enable': false,
    'icon': Icon(Icons.grade),
  },
];
  
  String selectedItem = "";

  void updateSelectedITem(String val) {
    setState(() {
      selectedItem = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: 'circle',
                icon: const Icon(Icons.format_shapes),
                labelText: 'Shape',
                items: _items,
                onChanged: (val) => updateSelectedITem(val),
            ),
            Padding(padding: const EdgeInsets.all(16), child: Text('selected $selectedItem'),),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
