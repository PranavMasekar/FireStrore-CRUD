import 'package:flutter/material.dart';

import 'UpdateStudentPage.dart';

class ListStudentPage extends StatefulWidget {
  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  deleteUser(id) {
    print('mauj hi mauj');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            1: FixedColumnWidth(140),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(
                        'Action',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text(
                      'Pranav',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Text(
                      'PranavMasekar4@gmail.com',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                TableCell(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateStudentPage(),
                          ),
                        ),
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.orange,
                      ),
                    ),
                    IconButton(
                        onPressed: () => {deleteUser(1)},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
