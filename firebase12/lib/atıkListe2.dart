import 'package:flutter/material.dart';

class WasteTrackingResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> selectedWastes;

  WasteTrackingResultsPage({required this.selectedWastes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atık Takibi Sonuçları',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            DataTable(
              columns: [
                DataColumn(label: Text('Tarih')),
                DataColumn(label: Text('Atık Türü')),
                DataColumn(label: Text('Durumu')),
              ],
              rows: selectedWastes
                  .map(
                    (waste) => DataRow(cells: [
                  DataCell(Text(waste['Tarih'])),
                  DataCell(Text(waste['Atık Türü'])),
                  DataCell(Text(waste['Durumu'])),
                ]),
              )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}