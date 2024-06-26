import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onSave;

  NotificationsScreen({required this.onSave});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _isFoodWasteSelected = false;
  bool _isOilWasteSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'ATIK TÜRÜ SEÇİNİZ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: Text('Gıda Atığı'),
            value: _isFoodWasteSelected,
            onChanged: (bool value) {
              setState(() {
                _isFoodWasteSelected = value;
              });
            },
            activeColor: Color(0xff84bb6f),
          ),
          SwitchListTile(
            title: Text('Yağ Atığı'),
            value: _isOilWasteSelected,
            onChanged: (bool value) {
              setState(() {
                _isOilWasteSelected = value;
              });
            },
            activeColor: Color(0xff84bb6f),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              List<Map<String, dynamic>> selectedWastes = [];
              if (_isFoodWasteSelected) {
                selectedWastes.add({
                  'Tarih': '20.06.2024',
                  'Atık Türü': 'Gıda',
                  'Durumu': 'İletildi'
                });
              }
              if (_isOilWasteSelected) {
                selectedWastes.add({
                  'Tarih': '10.06.2024',
                  'Atık Türü': 'Yağ',
                  'Durumu': 'Alındı'
                });
              }
              widget.onSave(selectedWastes);
            },
            child: Text('GÖNDER'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff7cc2d8),
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

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


