import 'package:flutter/material.dart';

class DescPage extends StatelessWidget {
  const DescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TablePage();
  }
}


class TablePage extends StatelessWidget {
  // Define data for each cell
  final List<List<Widget>> cellData = [
    [Text('खोली प्रकार:'),
      TextFormField(decoration: InputDecoration(labelText: 'Input Field')), Text(''),
      TextFormField(decoration: InputDecoration(labelText: '')), ElevatedButton(onPressed: () {}, child: Text('Button'))],
    [Text('मालकाचे, भाडेकरूचे/भोगवतदाराचेनाव'),
      TextFormField(decoration: InputDecoration(labelText: 'Input Field')), Text(''),
      TextFormField(decoration: InputDecoration(labelText: 'Input Field')), ElevatedButton(onPressed: () {}, child: Text('Button'))],

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Table Example')),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(2.0),
            2: FlexColumnWidth(2.0),
          },
          children: <TableRow>[
            for (int i = 0; i < cellData.length; i++)
              TableRow(
                children: <Widget>[
                  TableCell(child: Container(padding: EdgeInsets.all(8.0), child: cellData[i][0])),
                  TableCell(child: Container(padding: EdgeInsets.all(8.0), child: cellData[i][1])),
                  TableCell(child: Container(padding: EdgeInsets.all(8.0), child: cellData[i][2])),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
