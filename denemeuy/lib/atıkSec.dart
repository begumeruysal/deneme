import 'package:flutter/material.dart';
import 'atıkListe.dart';

class WasteSelectionPage extends StatefulWidget {
  @override
  _WasteSelectionPageState createState() => _WasteSelectionPageState();
}

class _WasteSelectionPageState extends State<WasteSelectionPage> {
  bool _isFoodWasteSelected = false;
  double _foodWasteAmount = 0;

  bool _isOilWasteSelected = false;
  double _oilWasteAmount = 0;

  List<Map<String, dynamic>> _selectedWastes = [];

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
          if (_isFoodWasteSelected)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Atık miktarı seçin (kg)'),
                ),
                Slider(
                  value: _foodWasteAmount,
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.black,
                  divisions: 50,
                  max: 50,
                  min: 0,
                  label: _foodWasteAmount.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _foodWasteAmount = value;
                    });
                  },
                ),
              ],
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
          if (_isOilWasteSelected)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Atık miktarı seçin (L)'),
                ),
                Slider(
                  value: _oilWasteAmount,
                  activeColor: Colors.orangeAccent,
                  inactiveColor: Colors.black,
                  divisions: 50,
                  max: 50,
                  min: 0,
                  label: _oilWasteAmount.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _oilWasteAmount = value;
                    });
                  },
                ),
              ],
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _selectedWastes.clear();
              if (_isFoodWasteSelected) {
                _selectedWastes.add({
                  'Tarih': '20.06.2024',
                  'Atık Türü': 'Gıda',
                  'Miktar': _foodWasteAmount.toString() + ' kg',
                  'Durumu': 'İletildi'
                });
              }
              if (_isOilWasteSelected) {
                _selectedWastes.add({
                  'Tarih': '10.06.2024',
                  'Atık Türü': 'Yağ',
                  'Miktar': _oilWasteAmount.toString() + ' L',
                  'Durumu': 'Alındı'
                });
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WasteTrackingResultsPage(
                    selectedWastes: _selectedWastes,
                  ),
                ),
              );
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

